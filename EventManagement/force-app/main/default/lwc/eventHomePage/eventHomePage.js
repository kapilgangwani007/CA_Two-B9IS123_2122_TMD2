import { LightningElement } from 'lwc';
import event from '@salesforce/resourceUrl/event';
export default class EventHomePage extends LightningElement {
getEventURL = '';
createEventURL = '';
updateEventURL = '';
deleteEventURL = '';

    createEventIcon = event + '/create.jpg';
    getEventIcon = event + '/get.jpg';
    updateEventIcon = event + '/update.png';
    deleteEventIcon = event + '/delete.jpg';

    connectedCallback() {
        const linkToCase = window.location.origin +'/event/s/';
                    
        this.getEventURL = linkToCase+'get-event';
        this.createEventURL = linkToCase+'create-event';
        this.updateEventURL = linkToCase+'update-event';
        this.deleteEventURL = linkToCase+'delete-event';
    }
}
