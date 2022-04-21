import { LightningElement} from 'lwc';
import getEventsList from '@salesforce/apex/EventManagementController.getEventsList'; // import class to do server call via function
const columns = [
    {label: 'Event Name', fieldName: 'Name_Link__c', type: 'url',sortable: true, 
            typeAttributes: {label: { fieldName: 'Name' }, target: '_blank'}},
    { label: 'Event Name', fieldName: 'Name_Link__c',sortable: true,type: 'text', cellAttributes: { alignment: 'left' },hideDefaultActions: true },
    { label: 'Description', fieldName: 'Event_Description__c',type: 'text',sortable: true, cellAttributes: { alignment: 'left' }, hideDefaultActions: true },
    {label: 'Status',fieldName: 'Event_Status__c', type: 'text', sortable: true, cellAttributes: { alignment: 'left' },hideDefaultActions: true},
    { label: 'Site', fieldName: 'Event_Site__c',sortable: true, cellAttributes: { alignment: 'left' }, type: 'url',hideDefaultActions: true }
];
export default class EventList extends LightningElement {
// defining variables and initializing some of the variables as default value and blank.
    tableData=[];
    columns = columns;
    defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy = 'Event_Status__c';

    // Used to perform function call on load page
    connectedCallback() {
        this.handleEvents();
    }

    // function to do server call with class EventSubCategoryController to perform GET method of API to get event details.
    handleEvents(){
        getEventsList().then(data => {
                   if(data != '' && data != null && data != undefined){
                        this.tableData =data;
                    }else{
                      this.showMessage('Error!','Error',data); // calling function of showMessage
                   }
                }).catch(error => {
                   this.showMessage('Error!','Error',error.body.message);
                });
    }

    // Used to sort the 'Categories' column
    // Taken from https://developer.salesforce.com/docs/component-library/bundle/lightning-datatable/example : Salesforce Licence
    sortBy(field, reverse, primer) {
        const key = primer
            ? function (x) {
                  return primer(x[field]);
              }
            : function (x) {
                  return x[field];
              };

        return function (a, b) {
            a = key(a);
            b = key(b);
            return reverse * ((a > b) - (b > a));
        };
    }

    // Taken from https://developer.salesforce.com/docs/component-library/bundle/lightning-datatable/example : Salesforce Licence
    onHandleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.tableData];

        cloneData.sort(this.sortBy(sortedBy, sortDirection === 'asc' ? 1 : -1));
        this.tableData = cloneData;
        this.sortDirection = sortDirection;
        this.sortedBy = sortedBy;
    }


    // function to show error message in UI if comes.
    showMessage(header,type,msg) {
            const event = new ShowToastEvent({
                title: header,
                variant: type,
                message: msg
            });
            this.dispatchEvent(event);
    }
}