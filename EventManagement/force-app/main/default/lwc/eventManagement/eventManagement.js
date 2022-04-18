import { LightningElement} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getEventById from '@salesforce/apex/EventManagementController.getEventById'; // import class to do server call via function
export default class EventManagement extends LightningElement {

    // defining variables and initializing some of the variables as default value and blank.
    eventId='';
    eventDetails = [];
    isEventAvailable = false;
    startTime;
    endTime;

    // function to do server call with class EventManagementController to perform GET method of API to get event details.
    handleEventSearch(){
        getEventById({
                    eventId: this.eventId //sending parament as an event Id.
                }).then(data => {
                   if(data != '' && data != null && data != undefined){
                        const eventData = JSON.parse(data);  // Parsing JSON  to Object
                        this.eventDetails = eventData; // Storing response from class
                        this.isEventAvailable = true; // Used to show the section of API Details and Event Details
                    }else{
                        this.isEventAvailable = false; // Used to show the section of API Details and Event Details
                      this.showMessage('Error!','Error',data); // calling function of showMessage
                   }
                }).catch(error => {
                    this.isEventAvailable = false;
                   this.showMessage('Error!','Error',error.body.message);
                });
    }

    // function to check new value on event Id field and perform action of hiding and showing some division.
    handleEventIdChange(event){
        this.eventId = event.detail.value;
        this.isEventAvailable = false;
        this.eventDetails = '';
    } 

    //function to reset all values when reset button is clicked
    resetAll(){
        this.eventId = '';
        this.eventDetails = '';
        this.isEventAvailable = false;
    }

    // function to return some hard-coded events name and Id
    // Taken From https://developer.salesforce.com/docs/component-library/bundle/lightning-combobox/example : Salesforce Licence
    get samplesEvent() {
        return [
            { label: 'Northern Vegan Festival 2022', value: '254539593777' },
            { label: 'The Pink Picnic 2022', value: '253332112167' },
            { label: 'Swiftogeddon - The Taylor Swift Club Night', value: '214703783797' },
            { label: 'Manchester Careers Fair', value: '227566145467' },
            { label: 'Haigh Dino Days', value: '256736956147' },
            { label: 'MANCHESTER IFTAR DINNER EVENT 2022 (WEDNESDAY 27TH APRIL 2022)', value: '277720368097' },
            { label: 'Big Fish Little Fish x Camp Bestival - Manchester Family Rave - Mark XTC', value: '264137290747' },
            { label: 'Manchester Vintage Kilo Sale', value: '298263583407' },
            { label: 'Macclesfield Craft Beer & Gin Festival - 6th & 7th May 2022', value: '298774621937' },
            { label: 'Manchester Warehouse Worship', value: '291352211307' },
            { label: 'Etihad Stadium Wedding Fayre hosted by County Brides', value: '167945897701' },
            { label: 'KLUB KIDS UK presents DRAG FEST MANCHESTER 2022 (ages 18+)', value: '232550493787' },
            { label: 'Achieving Net Zero in Housing Live Event (Sponsored by WSP)', value: '295311734347' }
        ];
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
