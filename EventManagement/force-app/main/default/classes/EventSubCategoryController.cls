/* 
* This class is used to perform integration of GET method with eventbrite site to 
* get categories and subcategories as response.
*/
//Creating a class to perform integration
public class EventSubCategoryController {
    
    @AuraEnabled
    //Method to get subcategories of events
    public static String getEventSubCategories() {
        
        // wrapper class to store the data which will be shown in UI
        EventToShowSubCatWrapper toShowInUI = new EventToShowSubCatWrapper();
        try{
            //Creating endpiont URL
            String url = 'https://www.eventbriteapi.com/v3/subcategories/';
            String apiKey = '/?token=XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
            String apiStatusCode = '';
            String apiRequest = '';
            String endpointURL = url + apiKey; // https://www.eventbriteapi.com/v3/subcategories/?token=XZF6XPYXRASKPB2RPTU3
            //Taken from https://www.eventbrite.com/platform/api#/reference/categories/list/list-of-subcategories?console=1
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
            HttpRequest req = new HttpRequest();
            req.setHeader('Authorization', 'Bearer XZF6XPYXRASKPB2RPTU3'); // auth token 
            req.setHeader('Accept', 'application/json'); // to accept only json
            req.setHeader('Content-Type','application/json;charset=UTF-8');
            req.setEndpoint(endpointURL);
            req.setMethod('GET');
            apiRequest = req.toString(); // storing api request in variable
            
            // Send the request, and return a response
            HttpResponse res = http.send(req);
            apiStatusCode = String.valueOf(res.getStatusCode()); // Storing status code in variable
            
            //logic to convert json in object via wrapper when response is success.
            if(res.getStatusCode() == 200){
                //Wrapper to store data from response
                EventSubCategoryWrapper subCatObj = (EventSubCategoryWrapper)System.JSON.deserialize(res.getBody(), EventSubCategoryWrapper.class);
                List<EventSubCategoryWrapper.cls_subcategories> subCategoryList = subCatObj.subcategories;
                List<EventToShowSubCatWrapper.subCategoryDetails> allSubcatList = new  List<EventToShowSubCatWrapper.subCategoryDetails>();
                
                for(EventSubCategoryWrapper.cls_subcategories sub : subCategoryList){
                    EventToShowSubCatWrapper.subCategoryDetails eachSubcat = new  EventToShowSubCatWrapper.subCategoryDetails();
                    eachSubcat.subId  = sub.Id; 
                    eachSubcat.categoryName = sub.parent_category.name; 
                    eachSubcat.subcategoryName  = sub.name; 
                    eachSubcat.url = sub.resource_uri; 
                    allSubcatList.add(eachSubcat);
                }
                //Storing values from response to show it in UI
                toShowInUI.subcategories = allSubcatList;         
                toShowInUI.apiResponse = res.getBody();
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
            }
        }catch(Exception exp){
            System.debug('@@Exception Occurred : '+exp.getStackTraceString());
        }
        // returning a response
        return JSON.serialize(toShowInUI);
        
    }
    
    
}