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

}
