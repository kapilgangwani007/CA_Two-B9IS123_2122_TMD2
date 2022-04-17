import { LightningElement} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getEventSubCategories from '@salesforce/apex/EventSubCategoryController.getEventSubCategories'; // import class to do server call via function

const columns = [
    { label: 'Id', fieldName: 'subId',sortable: true, cellAttributes: { alignment: 'left' },hideDefaultActions: true },
    { label: 'Name', fieldName: 'subcategoryName',sortable: true, cellAttributes: { alignment: 'left' }, hideDefaultActions: true },
    {label: 'Category Name',fieldName: 'categoryName', 
    type: 'text', sortable: true, cellAttributes: { alignment: 'left' }},
    { label: 'url', fieldName: 'url',sortable: true, cellAttributes: { alignment: 'left' }, type: 'url',hideDefaultActions: true, }
];

export default class EventSubCategoriesList extends LightningElement {

    // defining variables and initializing some of the variables as default value and blank.
    eventDetails = [];
    isEventAvailable = false;
    subcategoriesDetails=[];
    tableData = [];
    columns = columns;
    defaultSortDirection = 'asc';
    sortDirection = 'asc';
    sortedBy = 'categoryName';

    connectedCallback() {
        this.handleEventSubCatSearch();
    }

    // function to do server call with class EventSubCategoryController to perform GET method of API to get event details.
    handleEventSubCatSearch(){
        getEventSubCategories().then(data => {
                   if(data != '' && data != null && data != undefined){
                        const eventData = JSON.parse(data);  // Parsing JSON  to Object
                        this.subcategoriesDetails = eventData; // Storing response from class

                        this.tableData =eventData.subcategories;
                        this.isEventAvailable = true; // Used to show the section of API Details and Event SubCategory Details
                    }else{
                        this.isEventAvailable = false; // Used to show the section of API Details and Event Event SubCategory Details
                      this.showMessage('Error!','Error',data); // calling function of showMessage
                   }
                }).catch(error => {
                    this.isEventAvailable = false;
                   this.showMessage('Error!','Error',error.body.message);
                });
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
}