/* 
* This class is used to perform integration of GET method with eventbrite site to get event details as response of request event Id.
*/

//Creating a class to perform integration
public class EventManagementController {
	
    @AuraEnabled //anotation used in salesforce to send data in UI
	//Method to get event details
    public static String getEventById(String eventId) {
        String eventDetails = '';
        EventWrapper eventObj = new EventWrapper();
		
		// wrapper class to store the data which will be shown in UI
        EventShowWrapper toShowInUI = new EventShowWrapper();
		
		//try catch to catch exception
        try{
			
			//Creating endpiont URL
			// Taken from https://www.eventbrite.com/platform/api#/reference/event/retrieve-an-event?console=1
            String url = 'https://www.eventbriteapi.com/v3/events/';
            String apiKey = 'XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            String apiURL = '/?token=';
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL =  url + eventId + apiURL + apiKey;
			
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer XZF6XPYXRASKPB2RPTU3');
            req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type','application/json;charset=UTF-8');
            req.setEndpoint(endpointURL);
            req.setMethod('GET');
            apiRequest = req.toString();
			
            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode());
			
            // logic when success response received
            if(res.getStatusCode() == 200){
               String toShowResponse = res.getBody().replace('end', 'ends').replace('currency', 'currencys');
                eventObj = (EventWrapper)System.JSON.deserialize(toShowResponse, EventWrapper.class);
				//Storing data in wrapper
                EventWrapper.cls_name nameDetails = eventObj.name;
                EventWrapper.cls_description descriptionDetails = eventObj.description;
                EventWrapper.cls_start startTiming = eventObj.start;
                EventWrapper.cls_end endTiming = eventObj.ends;
                
				// Creating record in Salesforce with the response data
                Event_Management__c eve = new Event_Management__c();
                eve.API_Response__c = eventDetails;
                eve.JSON_To_Object_Response__c = JSON.serialize(eventObj);
                eve.Response_Plain_Text__c = eventDetails;
                eve.API_Endpoint_URL__c = endpointURL;
                eve.API_Method__c = 'GET';
                eve.API_Status_Code__c = String.valueOf(res.getStatusCode());
                eve.API_Request__c = req.toString();
                eve.Event_Name__c = nameDetails.text;
                eve.Event_Status__c = eventObj.status;
                eve.Event_Summary__c =eventObj.summary;
                eve.Event_Site__c = eventObj.url;
                eve.Event_Start_Time__c = startTiming.local;
                eve.Event_End_Time__c = endTiming.local;
                eve.Event_Description__c = descriptionDetails.text;
                insert eve;
                
				// Storing data to show it in UI
                toShowInUI.eventName = nameDetails.text;
                toShowInUI.description = descriptionDetails.text;
                toShowInUI.startTime = startTiming.local;
                toShowInUI.endTime = endTiming.local;
                toShowInUI.url = eventObj.url;
                toShowInUI.status = eventObj.status;
                toShowInUI.currencys = eventObj.currencys;
                toShowInUI.summary = eventObj.summary;
                toShowInUI.venue_id = eventObj.venue_id;
                toShowInUI.organization_id = eventObj.organizer_id;
                toShowInUI.eventId = eventObj.id;
                toShowInUI.apiResponse = toShowResponse;
                toShowInUI.apiEndpointURL = endpointURL;
                toShowInUI.apiMethod = 'GET';
                toShowInUI.apiStatusCode = apiStatusCode;
                toShowInUI.apiRequest = apiRequest;
                
            }else{
				// If not success response then to show only error response
                toShowInUI.apiResponse = res.getBody();
                toShowInUI.apiEndpointURL = endpointURL;
                toShowInUI.apiMethod = 'GET';
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
