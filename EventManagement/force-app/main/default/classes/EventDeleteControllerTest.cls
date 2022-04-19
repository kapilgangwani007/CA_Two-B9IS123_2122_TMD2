@isTest 
global class EventDeleteControllerTest {

	//To validate all values are blank in return value
    @isTest static void deleteEventTest() {
        String eventId = '123143423';
        String result = EventDeleteController.deteletEventById(eventId);
        System.debug('result: '+result);
        String expectedResult = '{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":null,"apiResponse":null,"apiRequest":null,"apiMethod":null,"apiEndpointURL":null}';
        System.assertEquals(result,expectedResult,'All values are blank');
    }
    
	// To validate result in not blank    
   @isTest static void  eventDeleteSuccessTest(){
         String eventId = '214703783797';
        String expectedResult = '{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":"200","apiResponse":"{\"deleted\":true}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3, Method=DELETE]","apiMethod":"DELETE","apiEndpointURL":"https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3"}';
       	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventDeleteSuccess());
        String result = EventDeleteController.deteletEventById(eventId);
      	System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    // To validate result in not blank
     @isTest static void  eventDeleteErrorTest(){
        String eventId = '214703783797';
        String notExpected ='{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":"200","apiResponse":"{\"deleted\":true}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3, Method=DELETE]","apiMethod":"DELETE","apiEndpointURL":"https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3"}';
      	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventDeleteError());
        String result = EventDeleteController.deteletEventById(eventId);
        System.assertNotEquals(result,notExpected,'Result should not this.');
        Test.StopTest();
    }
    
    global class EventDeleteSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":"200","apiResponse":"{\"deleted\":true}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3, Method=DELETE]","apiMethod":"DELETE","apiEndpointURL":"https://www.eventbriteapi.com/v3/events/322467608297/?token=XZF6XPYXRASKPB2RPTU3"}';
            res.setBody(responseString);
            res.setStatusCode(200);
            System.assertEquals('DELETE', req.getMethod());
            return res;
        }
    }
    //To validate API method is DELETE
    global class EventDeleteError implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"status_code": 401,"error_description": "The OAuth token you provided was invalid.","error": "INVALID_AUTH"}';
            res.setBody(responseString);
            res.setStatusCode(404);
            System.assertEquals('DELETE', req.getMethod());
            return res;
        }
    }

}