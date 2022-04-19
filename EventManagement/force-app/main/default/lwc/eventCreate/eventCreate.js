import { LightningElement,track,wire,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getOrganisationId from '@salesforce/apex/EventGetOrganisationId.getOrganisationId'; // importing class to do server call via function of getting organization Id
import createEvent from '@salesforce/apex/EventCreateController.createEvent'; // importing class to do server call via function of creating an event
export default class EventCreate extends LightningElement {

    // defining variables and initializing some of the variables as default value and blank.
    eventName='';
    eventDescription='';
    startDateTime='';
    password='';
    capacity=null;
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
    isCreateEventError=false;
    currentDateTime='' ;
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

    // function to check new value on start time field
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

    // function to check new value on organization Id field
    handleEventOrgIdChange(event){
    this.organizationId = event.target.value;
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

    // function to do server call with class EventCreateController to perform POST method of API to get organization Id.
    handleOrganizationId(event){
         this.isCreateEventAvailable= false;
         this.isCreateEventError = false;
        getOrganisationId().then(result => {
            if(result != '' && result != null && result != undefined){
                const orgData = JSON.parse(result); // Parsing JSON to Object 
                this.orgUserDetails = orgData; // Storing response from class
                this.organizationId = this.orgUserDetails.userId; // Getting User Id from the response stored variable
                this.isOrgIdAvailable = true; // Used to show the section of API Details and Event Details
            }else{
                this.orgUserDetails = [];
                this.isOrgIdAvailable = false; // Used to show the section of API Details and Event Details
            }
        }).catch(error => {
            this.orgUserDetails = [];
            this.isOrgIdAvailable = false;
            this.showToastMessage('Error!','Error',error.body.message); // calling function of showMessage
        });
    }

    // function to do server call with class EventCreateController to perform POST method of API to Create an event.
    handleCreateEvent(event){
        
        // validation to check required fields after clicking create event button
        let validated = false;
        let isEventNameValid = false;
        var isCurrencyValid = false;
        var isStartTimeValid = false;
        var isEndTimeValid =false;
        var isOrganisationValid =false;

        let inputEventName = this.template.querySelector( ".eventName" );
            isEventNameValid =  inputEventName.reportValidity();
        let inputCurrency = this.template.querySelector( ".currency" );
        var isCurrencyValid =  inputCurrency.reportValidity();
        let inputStartTime = this.template.querySelector( ".startTime" );
        isStartTimeValid =  inputStartTime.reportValidity();
        let inputEndTime = this.template.querySelector( ".endtime" );
            isEndTimeValid =  inputEndTime.reportValidity();
        let inputOrganisation = this.template.querySelector( ".organizationId" );
        var isOrganisationValid =  inputOrganisation.reportValidity();
        

        if(isEventNameValid && isCurrencyValid && 
        isStartTimeValid && isEndTimeValid && 
        isOrganisationValid){
            validated = true;
            }else{
                validated = false;
            }
        if(validated){

        
        this.isOrgIdAvailable = false;
        let eventDetails =[];
        eventDetails.push({eventName:this.eventName,eventDescription:this.eventDescription,
            startDateTime:this.setStartTime,endDateTime:this.setEndTime,password:this.password,capacity:this.capacity,
            eventSeatMapValue:this.eventSeatMapValue,eventSeatValue:this.eventSeatValue,eventSeriesValue:this.eventSeriesValue,
            eventSelectSeatValue:this.eventSelectSeatValue,currencys:this.currency,locale:this.locale,
            eventOnlineValue:this.eventOnlineValue,eventShareableValue:this.eventShareableValue,eventInviteValue:this.eventInviteValue,
            organizerId:this.organizerId,eventRemaningValue:this.eventRemaningValue,eventListedValue:this.eventListedValue,
            eventColorValue:this.eventColorValue,timeZone:this.timeZone});

            this.eventObject = JSON.stringify(eventDetails);
            createEvent({
                eventDataInfo : this.eventObject,
                organizationId : this.organizationId
            }).then(result => {
                if(result != '' && result != null && result != undefined){
                    const createdEventData = JSON.parse(result)
                    this.createdEventDetails = createdEventData; // Storing response from class
                   this.isCreateEventAvailable= this.createdEventDetails.apiStatusCode == '200' ? true : false ; // used to show API response when response is success or failure
                    this.isCreateEventError= this.createdEventDetails.apiStatusCode == '200' ? false : true ;
                }else{
                    this.isCreateEventAvailable= false;
                    this.isCreateEventError = false
                    this.createdEventDetails = [];
                }
            }).catch(error => {
                this.isCreateEventAvailable= false;
                this.isCreateEventError= false;
                this.createdEventDetails = [];
                this.showToastMessage('Error!','Error',error.body.message);
            });
        }
    }
    

    // function to show error message in UI if comes.
    showToastMessage(header,type,msg) {
            const event = new ShowToastEvent({
                title: header,
                variant: type,
                message: msg
            });
            this.dispatchEvent(event);
    }

}
