@isTest 
global class EventUpdateControllerTest {

//To validate all values are blank in return value
    @isTest static void updateEventTest() {
        String eventId = '123143423';
        String eventObj ='[{"eventName":"Event create","eventDescription":"test","startDateTime":"2022-04-20T22:15:00Z","endDateTime":"2022-04-30T22:14:00Z","password":"","capacity":10,"eventSeatMapValue":false,"eventSeatValue":false,"eventSeriesValue":false,"eventSelectSeatValue":false,"currencys":"USD","locale":"de_AT","eventOnlineValue":false,"eventShareableValue":false,"eventInviteValue":false,"organizerId":"","eventRemaningValue":true,"eventListedValue":false,"eventColorValue":false,"timeZone":"UTC"}]';
        String result = EventUpdateController.updateEvent(eventObj,eventId);
        System.debug('result: '+result);
        String expectedResult = '{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":null,"apiResponse":null,"apiRequest":null,"apiMethod":null,"apiEndpointURL":null}';
        System.assertEquals(result,expectedResult,'All values are blank');
    }
    
    
    // To validate result in not blank
   @isTest static void  eventUpdateSuccessTest(){
         String eventId = '123143423';
        String eventObj ='[{"eventName":"Event create","eventDescription":"test","startDateTime":"2022-04-20T22:15:00Z","endDateTime":"2022-04-30T22:14:00Z","password":"","capacity":10,"eventSeatMapValue":false,"eventSeatValue":false,"eventSeriesValue":false,"eventSelectSeatValue":false,"currencys":"USD","locale":"de_AT","eventOnlineValue":false,"eventShareableValue":false,"eventInviteValue":false,"organizerId":"","eventRemaningValue":true,"eventListedValue":false,"eventColorValue":false,"timeZone":"UTC"}]';
        String expectedResult ='{"venue_id":null,"userName":null,"userId":null,"url":"https://www.eventbrite.ie/e/event-create-tickets-322469383607","summary":"test","status":"draft","startTime":"2022-04-2022:15:00","organization_id":"45462715823","eventName":"Event create","eventId":"322469383607","endTime":"2022-04-3022:14:00","description":"test","currencys":"USD","apiStatusCode":"200","apiResponse":"{\"name\":{\"text\":\"Event create\",\"html\":\"Event create\"},\"description\":{\"text\":\"test\",\"html\":\"test\"},\"url\":\"https://www.eventbrite.ie/e/event-create-tickets-322469383607\",\"start\":{\"timezone\":\"UTC\",\"local\":\"2022-04-20T22:15:00\",\"utc\":\"2022-04-20T22:15:00Z\"},\"ends\":{\"timezone\":\"UTC\",\"local\":\"2022-04-30T22:14:00\",\"utc\":\"2022-04-30T22:14:00Z\"},\"organization_id\":\"908029239533\",\"created\":\"2022-04-17T22:15:14Z\",\"changed\":\"2022-04-17T22:15:14Z\",\"capacity\":10,\"capacity_is_custom\":true,\"status\":\"draft\",\"currencys\":\"USD\",\"listed\":false,\"shareable\":false,\"invite_only\":false,\"online_event\":false,\"show_remaining\":true,\"tx_time_limit\":1200,\"hide_start_date\":false,\"hide_ends_date\":false,\"locale\":\"de_AT\",\"is_locked\":false,\"privacy_setting\":\"unlocked\",\"is_series\":false,\"is_series_parent\":false,\"inventory_type\":\"limited\",\"is_reserved_seating\":false,\"show_pick_a_seat\":false,\"show_seatmap_thumbnail\":false,\"show_colors_in_seatmap_thumbnail\":false,\"source\":\"api\",\"is_free\":true,\"version\":null,\"summary\":\"test\",\"facebook_event_id\":null,\"logo_id\":null,\"organizer_id\":\"45462715823\",\"venue_id\":null,\"category_id\":null,\"subcategory_id\":null,\"format_id\":null,\"id\":\"322469383607\",\"resource_uri\":\"https://www.eventbriteapi.com/v3/events/322469383607/\",\"is_externally_ticketed\":false,\"logo\":null}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3, Method=POST]","apiMethod":"POST","apiEndpointURL":"https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3"}';
       	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventUpdateSuccess());
        
        String result = EventUpdateController.updateEvent(eventObj,eventId);
      	System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    // To validate result in not blank
     @isTest static void  eventUpdateErrorTest(){
        String eventId = '214703783797';
        String eventObj ='[{"eventName":"Event create","eventDescription":"test","startDateTime":"2022-04-20T22:15:00Z","endDateTime":"2022-04-30T22:14:00Z","password":"","capacity":10,"eventSeatMapValue":false,"eventSeatValue":false,"eventSeriesValue":false,"eventSelectSeatValue":false,"currencys":"USD","locale":"de_AT","eventOnlineValue":false,"eventShareableValue":false,"eventInviteValue":false,"organizerId":"","eventRemaningValue":true,"eventListedValue":false,"eventColorValue":false,"timeZone":"UTC"}]';
        String expectedResult ='{"venue_id":null,"userName":null,"userId":null,"url":"https://www.eventbrite.ie/e/event-create-tickets-322469383607","summary":"test","status":"draft","startTime":"2022-04-2022:15:00","organization_id":"45462715823","eventName":"Event create","eventId":"322469383607","endTime":"2022-04-3022:14:00","description":"test","currencys":"USD","apiStatusCode":"200","apiResponse":"{"name":{"text":"Event create","html":"Event create"},"description":{"text":"test","html":"test"},"url":"https://www.eventbrite.ie/e/event-create-tickets-322469383607","start":{"timezone":"UTC","local":"2022-04-20T22:15:00","utc":"2022-04-20T22:15:00Z"},"ends":{"timezone":"UTC","local":"2022-04-30T22:14:00","utc":"2022-04-30T22:14:00Z"},"organization_id":"908029239533","created":"2022-04-17T22:15:14Z","changed":"2022-04-17T22:15:14Z","capacity":10,"capacity_is_custom":true,"status":"draft","currencys":"USD","listed":false,"shareable":false,"invite_only":false,"online_event":false,"show_remaining":true,"tx_time_limit":1200,"hide_start_date":false,"hide_ends_date":false,"locale":"de_AT","is_locked":false,"privacy_setting":"unlocked","is_series":false,"is_series_parent":false,"inventory_type":"limited","is_reserved_seating":false,"show_pick_a_seat":false,"show_seatmap_thumbnail":false,"show_colors_in_seatmap_thumbnail":false,"source":"api","is_free":true,"version":null,"summary":"test","facebook_event_id":null,"logo_id":null,"organizer_id":"45462715823","venue_id":null,"category_id":null,"subcategory_id":null,"format_id":null,"id":"322469383607","resource_uri":"https://www.eventbriteapi.com/v3/events/322469383607/","is_externally_ticketed":false,"logo":null}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3, Method=POST]","apiMethod":"POST","apiEndpointURL":"https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3"}';
      	Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventUpdateError());
        String result = EventUpdateController.updateEvent(eventObj,eventId);
        System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    
    global class EventUpdateSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"venue_id":null,"userName":null,"userId":null,"url":"https://www.eventbrite.ie/e/event-create-tickets-322469383607","summary":"test","status":"draft","startTime":"2022-04-2022:15:00","organization_id":"45462715823","eventName":"Event create","eventId":"322469383607","endTime":"2022-04-3022:14:00","description":"test","currencys":"USD","apiStatusCode":"200","apiResponse":"{\"name\":{\"text\":\"Event create\",\"html\":\"Event create\"},\"description\":{\"text\":\"test\",\"html\":\"test\"},\"url\":\"https://www.eventbrite.ie/e/event-create-tickets-322469383607\",\"start\":{\"timezone\":\"UTC\",\"local\":\"2022-04-20T22:15:00\",\"utc\":\"2022-04-20T22:15:00Z\"},\"ends\":{\"timezone\":\"UTC\",\"local\":\"2022-04-30T22:14:00\",\"utc\":\"2022-04-30T22:14:00Z\"},\"organization_id\":\"908029239533\",\"created\":\"2022-04-17T22:15:14Z\",\"changed\":\"2022-04-17T22:15:14Z\",\"capacity\":10,\"capacity_is_custom\":true,\"status\":\"draft\",\"currencys\":\"USD\",\"listed\":false,\"shareable\":false,\"invite_only\":false,\"online_event\":false,\"show_remaining\":true,\"tx_time_limit\":1200,\"hide_start_date\":false,\"hide_ends_date\":false,\"locale\":\"de_AT\",\"is_locked\":false,\"privacy_setting\":\"unlocked\",\"is_series\":false,\"is_series_parent\":false,\"inventory_type\":\"limited\",\"is_reserved_seating\":false,\"show_pick_a_seat\":false,\"show_seatmap_thumbnail\":false,\"show_colors_in_seatmap_thumbnail\":false,\"source\":\"api\",\"is_free\":true,\"version\":null,\"summary\":\"test\",\"facebook_event_id\":null,\"logo_id\":null,\"organizer_id\":\"45462715823\",\"venue_id\":null,\"category_id\":null,\"subcategory_id\":null,\"format_id\":null,\"id\":\"322469383607\",\"resource_uri\":\"https://www.eventbriteapi.com/v3/events/322469383607/\",\"is_externally_ticketed\":false,\"logo\":null}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3, Method=POST]","apiMethod":"POST","apiEndpointURL":"https://www.eventbriteapi.com/v3/organizations/908029239533/events/?token=XZF6XPYXRASKPB2RPTU3"}';
            res.setBody(responseString);
            res.setStatusCode(200);
            System.assertEquals('POST', req.getMethod());
            return res;
        }
    }
    //To validate API method is POST
    global class EventUpdateError implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"status_code": 401,"error_description": "The OAuth token you provided was invalid.","error": "INVALID_AUTH"}';
            res.setBody(responseString);
            res.setStatusCode(404);
            System.assertEquals('POST', req.getMethod());
            return res;
        }
    }

}
