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
                JSONResponse = res.getBody();
                
            }
        }catch(Exception exp){
            System.debug('@@Exception Occurred : '+exp.getStackTraceString());
        }
        
        return JSON.serialize(toShowInUI);
}
}
