import { LightningElement,track,wire,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getEventById from '@salesforce/apex/EventManagementController.getEventById';
import updateEvent from '@salesforce/apex/EventUpdateController.updateEvent';
export default class EventUpdate extends LightningElement {

    eventName='';
    eventDescription='';
    startDateTime='';
    password='';
    eventId = '';
    capacity=10;
    eventSeatValue =false;
    eventSeriesValue =false;
    eventSelectSeatValue =false;
    currency='';
    endDateTime='';
    locale='';
    timeZone='UTC';
    organizationId='';
    organizerId ='';
    eventOnlineValue= false;
    eventListedValue= false;
    eventShareableValue= false;
    eventInviteValue= false;
    eventSeatMapValue = false;
    eventRemaningValue =true;
    eventColorValue =false;
    isOrgIdAvailable = false;
    orgUserDetails = [];
    createdEventDetails = [];
    isCreateEventAvailable = false;
    eventObject={};
    eventDetails = [];
    isCreateEventError=false;
    setStartTime='';
    setEndTime='';

    // function to check new value on event Name field
    handleEventNameChange(event){
        this.eventName = event.target.value;
    }

    // function to check new value on event description field
    handleEventDesChange(event){
    this.eventDescription = event.target.value;
    }

	// function to check new value on event ID field
    handleEventIdChange(event){
    this.eventId = event.target.value;
    }

    handleEventStartTimeChange(event){
        this.startDateTime = event.target.value;
        var dateNTime = this.startDateTime.split("T");
        var timeOnly = dateNTime[1].split(":");
        this.setStartTime = dateNTime[0]+'T'+timeOnly[0]+':'+timeOnly[1]+':00Z';
    }

    // function to check new value on password field
    handleEventPasswordChange(event){
    this.password = event.target.value;
    }

    // function to check new value on capacity field
    handleEventCapacityChange(event){
    this.capacity = event.target.value;
    }

    // function to check new value on Seat field
    handleEventSeatChange(event){
    this.eventSeatValue = event.target.checked;
    }

    // function to check new value on is Series field
    handleEventSeriesChange(event){
    this.eventSeriesValue = event.target.checked;
    }

    // function to check new value on start time field
    handleEventSelectSeatChange(event){
    this.eventSelectSeatValue = event.target.checked;
    }

    // function to check new value on currency field
    handleEventCurrencyChange(event){
    this.currency = event.target.value;
    }

    // function to check new value on end time field
    handleEventEndTimeChange(event){
    this.endDateTime = event.target.value;
    var dateNTime = this.endDateTime.split("T");
    var timeOnly = dateNTime[1].split(":");
    this.setEndTime = dateNTime[0]+'T'+timeOnly[0]+':'+timeOnly[1]+':00Z';
    }

    // function to check new value on locale field
    handleEventLocaleChange(event){
    this.locale = event.target.value;
    }

    // function to check new value on online field
    handleEventOnlineChange(event){
    this.eventOnlineValue = event.target.checked;
    }

    // function to check new value on listed field
    handleEventListedChange(event){
    this.eventListedValue = event.target.checked;
    }

    // function to check new value on sharable field
    handleEventShareableChange(event){
    this.eventShareableValue = event.target.checked;
    }

    // function to check new value on invite field
    handleEventInviteChange(event){
    this.eventInviteValue = event.target.checked;
    }

    // function to check new value on seat map field
    handleEventSeatMapChange(event){
        this.eventSeatMapValue = event.target.checked;
    }

    // function to check new value on Seat Remaining field
    handleEventRemaningChange(event){
    this.eventRemaningValue = event.target.checked;
    }

    // function to check new value on color field
    handleEventColorChange(event){
    this.eventColorValue = event.target.checked;
    }

    // function to check new value on organiser Id field
    handleEventOrgnizerChange(event){
        this.organizerId = event.target.value;
    }


    // dunction to get event details from server
    handleEventDetails(){
        console.log('this.eventId : '+this.eventId)
       
        getEventById({
            eventId: this.eventId
        }).then(data => {
            if(data != '' && data != null && data != undefined){
                const eventData = JSON.parse(data); // Parsing JSON to Object 
                this.eventDetails = eventData; // Storing response from class
                this.eventName = this.eventDetails.eventName;
                this.eventDescription = this.eventDetails.description;
                this.startDateTime = this.eventDetails.startTime;
                this.currency = this.eventDetails.currencys;
                this.endDateTime = this.eventDetails.endTime;
                this.organizerId = this.eventDetails.organization_id;
                this.isEventAvailable = true;
            }else{
                this.isEventAvailable = false;
                this.showMessage('Error!','Error',data);
            }
        }).catch(error => {
            this.isEventAvailable = false;
            this.showMessage('Error!','Error',error.body.message);
        });
       
    }

}