public class EventCreateController {
@AuraEnabled
    public static String createEvent(Object eventObject,String organizationId) {
        String eventInfo = JSON.serialize(eventObject);
        String eventDetails='';
        EventWrapper eventObj = new EventWrapper();
        EventShowWrapper toShowInUI = new EventShowWrapper();
        try{
            String url = 'https://www.eventbriteapi.com/v3/organizations/';
            //String apiKey = 'XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            //String apiURL = '/?token=';
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL =  url + organizationId + '/events/';
            System.debug('endpointURL::' + endpointURL);
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer XZF6XPYXRASKPB2RPTU3');
			req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type','application/json;charset=UTF-8');
            req.setEndpoint(endpointURL);
            req.setBody(eventInfo);
            req.setMethod('GET');
            apiRequest = req.toString();
            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode());
            if(res.getStatusCode() == 200){
                //JSONResponse = res.getBody();
                String htmltagremove = res.getBody().substringAfter('<pre><code class="language-json">');
                String entityremove = htmltagremove.substringBefore('</code></pre>').replaceAll('&quot;','"');
                System.debug('@@@entityremove'+entityremove);
                String eventId= '1234345';
                String unwantedURL ='"<a href="https://www.eventbriteapi.com/v3/events/'+eventId+'/?token=XZF6XPYXRASKPB2RPTU3">https://www.eventbriteapi.com/v3/events/'+eventId+'/</a>"';
                System.debug('@@@unwantedURL'+unwantedURL);
                
                eventDetails = entityremove.replace(unwantedURL,'""');
                String toShowResponse = eventDetails.replace('end', 'ends').replace('currency', 'currencys');
                Event_Management__c eve2 = new Event_Management__c();
                eve2.API_Response__c = eventDetails;
                eve2.Response_Plain_Text__c = eventDetails;
                insert eve2;
                eventObj = (EventWrapper)System.JSON.deserialize(toShowResponse, EventWrapper.class);
                System.debug('@@eventObj::' + eventObj);
                
                EventWrapper.cls_name nameDetails = eventObj.name;
                EventWrapper.cls_description descriptionDetails = eventObj.description;
                EventWrapper.cls_start startTiming = eventObj.start;
                EventWrapper.cls_end endTiming = eventObj.ends;
                
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
                eve.Event_Start_Time__c = (startTiming.local).replace('T','');
                eve.Event_End_Time__c = (endTiming.local).replace('T','');
                eve.Event_Description__c = descriptionDetails.text;
                insert eve;
                
                toShowInUI.eventName = nameDetails.text;
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
                toShowInUI.apiMethod = 'GET';
                toShowInUI.apiStatusCode = apiStatusCode;
                toShowInUI.apiRequest = apiRequest;
                
            }else{
                toShowInUI.apiResponse = res.getBody();
                toShowInUI.apiEndpointURL = endpointURL;
                toShowInUI.apiMethod = 'GET';
                toShowInUI.apiStatusCode = String.valueOf(res.getStatusCode());
                toShowInUI.apiRequest = apiRequest;
                System.debug('res.getStatusCode() null: '+res.getStatusCode());
                return null;
            }
        }catch(Exception exp){
            System.debug('@@Exception Occurred : '+exp.getStackTraceString());
        }
        
        return JSON.serialize(toShowInUI);
}
}
