/*
 * This class is used to perform integration of GET method with eventbrite site to
 * get categories and subcategories as response.
 */
//Creating a class to perform integration
public class EventGetOrganisationId {

    @AuraEnabled
        //Method to get organisation ID of user  via auoth token
    public static String getOrganisationId() {
        EventUserOrgWrapper orgObj = new EventUserOrgWrapper();
        // wrapper class to store the data which will be shown in UI
        EventShowWrapper toShowInUI = new EventShowWrapper();
        try {
            //Taken from https://www.eventbrite.com/platform/api#/reference/organization/list-your-organizations/list-your-organizations?console=1
            //Creating endpiont URL
            String url = 'https://www.eventbriteapi.com/v3/users/me/organizations';
            String apiKey = 'XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            String apiURL = '/?token=';
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL = url + apiURL + apiKey;

            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setHeader('Accept', 'application/json');
            req.setHeader('Content-Type', 'application/json;charset=UTF-8');
            req.setEndpoint(endpointURL);
            req.setMethod('GET');
            apiRequest = req.toString();

            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode());

            //logic to convert json in object via wrapper when response is success.
            if (res.getStatusCode() == 200) {
                String JSONResponse = res.getBody().replace('_type', 'type');
                orgObj = (EventUserOrgWrapper)System.JSON.deserialize(JSONResponse,
                                EventUserOrgWrapper.class);
                List<EventUserOrgWrapper.cls_organizations> orgDataList = orgObj.organizations;
                toShowInUI.userName = orgDataList[0].name;
                toShowInUI.userId = orgDataList[0].id;
            }
            //Storing values from response to show it in UI
            toShowInUI.apiResponse = res.getBody();
            toShowInUI.apiEndpointURL = endpointURL;
            toShowInUI.apiMethod = 'GET';
            toShowInUI.apiStatusCode = String.valueOf(res.getStatusCode());
            toShowInUI.apiRequest = apiRequest;
        } catch (Exception exp) {
            System.debug('@@Exception Occurred : ' + exp.getStackTraceString());
        }
        // returning a response
        return JSON.serialize(toShowInUI);
    }
}