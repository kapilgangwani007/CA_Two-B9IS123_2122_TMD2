@isTest
global class EventSubCategoryControllerTest {
    //To validate all values are blank in return value
    @isTest static void getSubCatTest() {
        String result = EventSubCategoryController.getEventSubCategories();
        System.debug('result: '+result);
        String expectedResult = '{"subcategories":null,"apiStatusCode":null,"apiResponse":null,"apiRequest":null,"apiMethod":null,"apiEndpointURL":null}';
        System.assertEquals(result,expectedResult,'All values are blank');
    }
    
    
    // To validate result in not blank
    @isTest static void  eventSubCatSuccessTest(){
        String expectedResult ='{"subcategories":[{"url":"https://www.eventbriteapi.com/v3/subcategories/1001/","subId":"1001","subcategoryName":"Startups & Small Business","categoryName":"Business & Professional"},{"url":"https://www.eventbriteapi.com/v3/subcategories/1002/","subId":"1002","subcategoryName":"Finance","categoryName":"Business & Professional"}]}';
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventSubCategoryControllerSuccess());
        
        String result = EventSubCategoryController.getEventSubCategories();
      	System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    
     @isTest static void  eventSubCatErrorTest(){
        String eventId = '';
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventSubCategoryControllerError());
        String result = EventSubCategoryController.getEventSubCategories();
        System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    
    global class EventSubCategoryControllerSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"subcategories":[{"url":"https://www.eventbriteapi.com/v3/subcategories/1001/","subId":"1001","subcategoryName":"Startups & Small Business","categoryName":"Business & Professional"},{"url":"https://www.eventbriteapi.com/v3/subcategories/1002/","subId":"1002","subcategoryName":"Finance","categoryName":"Business & Professional"}]}';
            res.setBody(responseString);
            res.setStatusCode(200);
            System.assertEquals('GET', req.getMethod());
            return res;
        }
    }
     //To validate API method is GET
    global class EventSubCategoryControllerError implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"status_code": 401,"error_description": "The OAuth token you provided was invalid.","error": "INVALID_AUTH"}';
            res.setBody(responseString);
            res.setStatusCode(404);
            System.assertEquals('GET', req.getMethod());
            return res;
        }
    }
}