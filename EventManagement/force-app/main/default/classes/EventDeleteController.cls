/* 
* This class is used to perform integration of DELETE method with eventbrite site to 
* delete an event, sending event ID as request and getting response of deleted api details.
*/

//Creating a class to perform integration
public class EventDeleteController {
    
    @AuraEnabled
    //Method to delete event
    public static String deteletEventById(String eventId) {
        // wrapper class to store the data which will be shown in UI
        EventShowWrapper toShowInUI = new EventShowWrapper();
        //try catch block to capture expceptions
        try{
            //Creating endpiont URL
            String url = 'https://www.eventbriteapi.com/v3/events/';
            String apiKey = 'XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            String apiURL = '/?token=';
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL =  url + eventId + apiURL + apiKey;
            
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (DELETE) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setEndpoint(endpointURL);
            req.setHeader('Authorization', 'Bearer XZF6XPYXRASKPB2RPTU3');
            req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type','application/json;charset=UTF-8');
            req.setMethod('DELETE');
            apiRequest = req.toString();
            
            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode());
            
            //Storing values from response to show it in UI
            toShowInUI.apiResponse = res.getBody();
            toShowInUI.apiEndpointURL = endpointURL;
            toShowInUI.apiMethod = 'DELETE';
            toShowInUI.apiStatusCode = apiStatusCode;
            toShowInUI.apiRequest = apiRequest;
            
        }catch(Exception exp){
            System.debug('@@Exception Occurred : '+exp.getStackTraceString());
        }
        // returning a response
        return JSON.serialize(toShowInUI);
        
    }
}