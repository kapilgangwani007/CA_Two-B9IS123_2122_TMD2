import { LightningElement,track,wire,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import deteletEvent from '@salesforce/apex/EventDeleteController.deteletEventById';
export default class EventDelete extends LightningElement {
    eventId='';
    eventDetails = [];
    isEventAvailable = false;

    // function to do server call with class EventDeleteController to perform DELETE method of API.
    handleEventDelete(){
    deteletEvent({
            eventId: this.eventId
        }).then(data => {
            if(data != '' && data != null && data != undefined){
                const eventData = JSON.parse(data);// Parsing JSON to Object 
                this.eventDetails = eventData; // Storing response from class
                this.isEventAvailable = true;  // Used to show the section of API Details in UI
            }else{
                this.isEventAvailable = false;
            }
        }).catch(error => {
            this.isEventAvailable = false;
        });
    }

    // function to check new value on event Id field
    handleEventIdChange(event){
        this.eventId = event.detail.value;
        this.isEventAvailable = false;
        this.eventDetails = '';
    } 

    // To nullify all values and variable 
    resetAll(){
        this.eventId = '';
        this.eventDetails = '';
        this.isEventAvailable = false;
    }
}