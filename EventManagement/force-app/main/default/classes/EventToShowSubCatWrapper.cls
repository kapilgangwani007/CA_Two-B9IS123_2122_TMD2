/* 
* This class is used as a wrapper class to store the data getting from response of subcategories and showing sending it in UI
*/
public class EventToShowSubCatWrapper {
    public String apiResponse;
    public String apiEndpointURL;
    public String apiMethod;
    public String apiStatusCode;
    public String apiRequest;
    public List<subCategoryDetails> subcategories;
    public EventToShowSubCatWrapper(){}
    
    public EventToShowSubCatWrapper(String apiResponse, String apiEndpointURL, String apiMethod, String apiStatusCode,
                                    String apiRequest, List<subCategoryDetails> subcategories){
                                        this.apiResponse = apiResponse;
                                        this.apiEndpointURL = apiEndpointURL;
                                        this.apiMethod = apiMethod;
                                        this.apiStatusCode = apiStatusCode;
                                        this.apiRequest = apiRequest;
                                        this.subcategories = subcategories;
                                    }
    
    public class subCategoryDetails {
        public String url; //https://www.eventbriteapi.com/v3/subcategories/1001/
        public String subId; //1001
        public String categoryName; //Startups & Small Business
        public String subcategoryName; //Startups & Small Business'
        public subCategoryDetails(){}
        public subCategoryDetails(String subId, String categoryName,
                                        String subcategoryName, String url ){
                                            this.subId = subId;
                                            this.categoryName = categoryName;
                                            this.subcategoryName = subcategoryName;
                                            this.url = url;
                                        }
        
    }
}