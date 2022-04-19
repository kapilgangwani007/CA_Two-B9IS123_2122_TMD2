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

  
}
