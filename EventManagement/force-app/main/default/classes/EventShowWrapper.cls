/* 
* This class is used as a wrapper class to store the data getting from response and showing sending it in UI
*/
public class EventShowWrapper {
    public String eventName;
    public String description;
    public String startTime;
    public String endTime;
    public String url;
    public String status;
    public String currencys;
    public String summary;
    public String venue_id;
    public String organization_id;
    public String eventId;
    public String apiResponse;
    public String apiEndpointURL;
    public String apiMethod;
    public String apiStatusCode;
    public String apiRequest;
    public String userId;
    public String userName;
    public EventShowWrapper(){}
    public EventShowWrapper(String eventName, String description, String startTime, String endTime,
                            String url, String status, String currencys, String summary,
                            String venue_id, String organization_id, String eventId,
                            String apiResponse, String apiEndpointURL, String apiMethod, String apiStatusCode,
                            String apiRequest, String userId, String userName ){
                                
                                this.eventName = eventName;
                                this.description = description;
                                this.startTime = startTime;
                                this.endTime = endTime;
                                this.url = url;
                                this.status = status;
                                this.currencys = currencys;
                                this.summary = summary;
                                this.venue_id = venue_id;
                                this.organization_id = organization_id;
                                this.eventId = eventId;
                                this.apiResponse = apiResponse;
                                this.apiEndpointURL = apiEndpointURL;
                                this.apiMethod = apiMethod;
                                this.apiStatusCode = apiStatusCode;
                                this.apiRequest = apiRequest;
                                this.userId = userId;
                                this.userName = userName;    
                            }
}