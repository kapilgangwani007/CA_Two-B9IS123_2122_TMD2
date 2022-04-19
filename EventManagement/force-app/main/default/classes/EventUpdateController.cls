/* 
* This class is used to perform integration of POST method with eventbrite site to 
* update an event, sending data input by user and getting response of all event details.
*/

//Creating a class to perform integration
public class EventUpdateController {
    @AuraEnabled
     //Method to update event
    public static String updateEvent(String eventDataInfo, String eventId) {
        String removeStart = eventDataInfo.removeStart('[');
        String eventInputInfo = removeStart.removeEnd('[');
        
        // Wrapper to deserialize the data and store the data to create JSON request
        EventInputWrapper eventInputObj = (EventInputWrapper)JSON.deserialize(eventInputInfo, EventInputWrapper.class);
        EventCreateWrapper createJson = new EventCreateWrapper();
        EventCreateWrapper.cls_name nameDetails = new EventCreateWrapper.cls_name();
        EventCreateWrapper.cls_description desDetails = new EventCreateWrapper.cls_description();
        EventCreateWrapper.cls_start startDetails = new EventCreateWrapper.cls_start();
        EventCreateWrapper.cls_end endDetails = new EventCreateWrapper.cls_end();
        EventCreateWrapper.cls_event inputEvent = new EventCreateWrapper.cls_event();
        
        nameDetails.html = eventInputObj.eventName;
        desDetails.html = eventInputObj.eventDescription;
        startDetails.timezone = eventInputObj.timeZone;
        startDetails.utc = eventInputObj.startDateTime;
        endDetails.timezone = eventInputObj.timeZone;
        endDetails.utc = eventInputObj.endDateTime;
        
        inputEvent.start = startDetails;
        inputEvent.ends = endDetails;
        inputEvent.description = desDetails;
        inputEvent.name = nameDetails;
        inputEvent.capacity = eventInputObj.capacity;
        
        inputEvent.currencys= eventInputObj.currencys;
        inputEvent.locale = eventInputObj.locale;
        inputEvent.online_event= eventInputObj.eventOnlineValue;
        inputEvent.organizer_id= eventInputObj.organizerId;
        inputEvent.listed= eventInputObj.eventListedValue;
        inputEvent.shareable= eventInputObj.eventShareableValue;
        inputEvent.invite_only= eventInputObj.eventInviteValue;
        inputEvent.show_remaining= eventInputObj.eventRemaningValue;
        inputEvent.password= eventInputObj.password;
        inputEvent.is_reserved_seating= eventInputObj.eventSeatValue;
        inputEvent.is_series= eventInputObj.eventSeriesValue;
        inputEvent.show_pick_a_seat= eventInputObj.eventSelectSeatValue;
        inputEvent.show_seatmap_thumbnail= eventInputObj.eventSeatMapValue;
        inputEvent.show_colors_in_seatmap_thumbnail= eventInputObj.eventColorValue;
        createJson.event = inputEvent;
        
        //conversion of object to json
        String convertJSON = JSON.serialize(createJson);
        String convertCurrencys = convertJSON.removeEnd(']');
        
        //replacing as some identifier are reserve in class
        String eventInfo = convertCurrencys.replace('currencys', 'currency').replace('ends','end'); 
        String eventDetails='';
        EventWrapper eventObj = new EventWrapper();
        // wrapper class to store the data which will be shown in UI
        EventShowWrapper toShowInUI = new EventShowWrapper();
        //try catch block to capture expceptions
        try{
			//Creating endpiont URL
			//Taken from https://www.eventbrite.com/platform/api#/reference/event/update/update-an-event?console=1
            String url = 'https://www.eventbriteapi.com/v3/events/';
            String apiKey = '/?token=XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL = url + eventId + apiKey; //https://www.eventbriteapi.com/v3/events/eventId/?token=XZF6XPYXRASKPB2RPTU3
            
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (POST) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer XZF6XPYXRASKPB2RPTU3');
            req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type','application/json;charset=UTF-8');
            req.setEndpoint(endpointURL);
            req.setBody(eventInfo);
            req.setMethod('POST');
            apiRequest = req.toString();
            
            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode());
            
            // logic when success response received
            if(res.getStatusCode() == 200){
                String toShowResponse = (res.getBody()).replace('end', 'ends').replace('currency', 'currencys');
                eventObj = (EventWrapper)System.JSON.deserialize(toShowResponse, EventWrapper.class);
                
                EventWrapper.cls_name nameDetail = eventObj.name;
                EventWrapper.cls_description descriptionDetails = eventObj.description;
                EventWrapper.cls_start startTiming = eventObj.start;
                EventWrapper.cls_end endTiming = eventObj.ends;
                
                //Creating a record in database to store it.
                Event_Management__c eve = new Event_Management__c();
                eve.API_Response__c = res.getBody();
                eve.JSON_To_Object_Response__c = JSON.serialize(eventObj);
                eve.Response_Plain_Text__c = res.getBody();
                eve.API_Endpoint_URL__c = endpointURL;
                eve.API_Method__c = 'POST';
                eve.API_Status_Code__c = String.valueOf(res.getStatusCode());
                eve.API_Request__c = req.toString();
                eve.Event_Name__c = nameDetail.text;
                eve.Event_Status__c = eventObj.status;
                eve.Event_Summary__c =eventObj.summary;
                eve.Event_Site__c = eventObj.url;
                eve.Event_Start_Time__c = (startTiming.local).replace('T','');
                eve.Event_End_Time__c = (endTiming.local).replace('T','');
                eve.Event_Description__c = descriptionDetails.text;
                insert eve;
                
                //Storing values from response to show it in UI
                toShowInUI.eventName = nameDetail.text;
                toShowInUI.description = descriptionDetails.text;
                toShowInUI.startTime = (startTiming.local).replace('T','');
                toShowInUI.endTime = (endTiming.local).replace('T','');
                toShowInUI.url = eventObj.url;
                toShowInUI.status = eventObj.status;
                toShowInUI.currencys = eventObj.currencys;
                toShowInUI.summary = eventObj.summary;
                toShowInUI.venue_id = eventObj.venue_id;
                toShowInUI.organization_id = eventObj.organizer_id;
                toShowInUI.eventId = eventObj.id;
                toShowInUI.apiResponse = toShowResponse;
                toShowInUI.apiEndpointURL = endpointURL;
                toShowInUI.apiMethod = 'POST';
                toShowInUI.apiStatusCode = apiStatusCode;
                toShowInUI.apiRequest = apiRequest;
            }else{
                toShowInUI.apiResponse = res.getBody();
                toShowInUI.apiEndpointURL = endpointURL;
                toShowInUI.apiMethod = 'POST';
                toShowInUI.apiStatusCode = String.valueOf(res.getStatusCode());
                toShowInUI.apiRequest = apiRequest;
            }
        }catch(Exception exp){
            System.debug('@@Exception Occurred : '+exp.getStackTraceString());
        }
		// returning a response
        return JSON.serialize(toShowInUI);
        
    }
}