import { LightningElement,track,wire,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getOrganisationId from '@salesforce/apex/EventGetOrganisationId.getOrganisationId';
export default class EventCreate extends LightningElement {

organizationId='';

    

    handleEventOrgIdChange(event){
    this.organizationId = event.target.value;
    }

    handleOrganizationId(event){
         this.isCreateEventAvailable= false;
    getOrganisationId().then(result => {
                   if(result != '' && result != null && result != undefined){
                       const orgData = JSON.parse(result)
                        console.log('Yes Data'+JSON.stringify(orgData));
                        this.orgUserDetails = orgData;
                        console.log('Result File if: '+JSON.stringify(this.orgUserDetails));
                        this.organizationId = this.orgUserDetails.userId;
                        this.isOrgIdAvailable = true;
                   }else{
                       console.log('Result File else: '+JSON.stringify(this.orgUserDetails));
                       this.orgUserDetails = [];
                       this.isOrgIdAvailable = true;
                   }
                }).catch(error => {
                    this.orgUserDetails = [];
                    this.isOrgIdAvailable = false;
                   this.showToastMessage('Error!','Error',error.body.message);
                });
    }



    showToastMessage(header,type,msg) {
            const event = new ShowToastEvent({
                title: header,
                variant: type,
                message: msg
            });
            this.dispatchEvent(event);
    }

}