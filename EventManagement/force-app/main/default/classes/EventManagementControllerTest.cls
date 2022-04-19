@isTest
global class EventManagementControllerTest {
    //To validate all values are blank in return value
    @isTest static void getEventTest() {
        String eventId = '12312433433';
        String result = EventManagementController.getEventById(eventId);
        System.debug('result: '+result);
        String expectedResult = '{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":null,"apiResponse":null,"apiRequest":null,"apiMethod":null,"apiEndpointURL":null}';
        System.assertEquals(result,expectedResult,'All values are blank');
    }
    
    
    
    @isTest static void  eventManagementSuccessTest(){
        String eventId = '254539593777';
        String expectedResult ='{"name":{"text":"Northern Vegan Festival 2022","html":"Northern Vegan Festival 2022"},"description":{"text":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!","html":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!"},"url":"https://www.eventbrite.co.uk/e/northern-vegan-festival-2022-tickets-254539593777","start":{"timezone":"Europe/London","local":"2022-05-15T10:30:00","utc":"2022-05-15T09:30:00Z"},"end":{"timezone":"Europe/London","local":"2022-05-15T16:30:00","utc":"2022-05-15T15:30:00Z"},"organization_id":"192538678939","created":"2022-01-24T14:30:02Z","changed":"2022-04-17T16:25:03Z","published":"2022-01-24T14:47:51Z","capacity":null,"capacity_is_custom":null,"status":"live","currency":"GBP","listed":true,"shareable":true,"online_event":false,"tx_time_limit":480,"hide_start_date":false,"hide_end_date":false,"locale":"en_GB","is_locked":false,"privacy_setting":"unlocked","is_series":false,"is_series_parent":false,"inventory_type":"limited","is_reserved_seating":false,"show_pick_a_seat":false,"show_seatmap_thumbnail":false,"show_colors_in_seatmap_thumbnail":false,"source":"coyote","is_free":false,"version":null,"summary":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!","facebook_event_id":"343290747435625","logo_id":"217221469","organizer_id":"12173097346","venue_id":"80786409","category_id":"110","subcategory_id":null,"format_id":"5","id":"254539593777","resource_uri":"https://www.eventbriteapi.com/v3/events/254539593777/","is_externally_ticketed":false,"logo":{"crop_mask":{"top_left":{"x":0,"y":47},"width":3992,"height":1996},"original":{"url":"https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F217221469%2F192538678939%2F1%2Foriginal.20220124-143922?auto=format%2Ccompress&q=75♯=10&s=4b490b30bc19f656c526f0480f155a33","width":3992,"height":2091},"id":"217221469","url":"https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F217221469%2F192538678939%2F1%2Foriginal.20220124-143922?h=200&w=450&auto=format%2Ccompress&q=75♯=10▭=0%2C47%2C3992%2C1996&s=427f41b341256ef934435594e81f3be9","aspect_ratio":"2","edge_color":"#aa9685","edge_color_set":true}}';
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventManagementSuccess());
        
        String result = EventManagementController.getEventById(eventId);
      	System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    // To validate result in not blank
     @isTest static void  eventManagementErrorTest(){
        String eventId = '';
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new EventManagementError());
        String result = EventManagementController.getEventById(eventId);
        System.assert(result!=null,'Result should not be null');
        Test.StopTest();
    }
    
    global class EventManagementSuccess implements HttpCalloutMock {
        global HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            String responseString ='{"name":{"text":"Northern Vegan Festival 2022","html":"Northern Vegan Festival 2022"},"description":{"text":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!","html":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!"},"url":"https://www.eventbrite.co.uk/e/northern-vegan-festival-2022-tickets-254539593777","start":{"timezone":"Europe/London","local":"2022-05-15T10:30:00","utc":"2022-05-15T09:30:00Z"},"end":{"timezone":"Europe/London","local":"2022-05-15T16:30:00","utc":"2022-05-15T15:30:00Z"},"organization_id":"192538678939","created":"2022-01-24T14:30:02Z","changed":"2022-04-17T16:25:03Z","published":"2022-01-24T14:47:51Z","capacity":null,"capacity_is_custom":null,"status":"live","currency":"GBP","listed":true,"shareable":true,"online_event":false,"tx_time_limit":480,"hide_start_date":false,"hide_end_date":false,"locale":"en_GB","is_locked":false,"privacy_setting":"unlocked","is_series":false,"is_series_parent":false,"inventory_type":"limited","is_reserved_seating":false,"show_pick_a_seat":false,"show_seatmap_thumbnail":false,"show_colors_in_seatmap_thumbnail":false,"source":"coyote","is_free":false,"version":null,"summary":"The HUGE Northern Vegan Festival is BACK at the BEC Arena, Manchester. 100+ vegan exhibitors and all your shopping under one roof!","facebook_event_id":"343290747435625","logo_id":"217221469","organizer_id":"12173097346","venue_id":"80786409","category_id":"110","subcategory_id":null,"format_id":"5","id":"254539593777","resource_uri":"https://www.eventbriteapi.com/v3/events/254539593777/","is_externally_ticketed":false,"logo":{"crop_mask":{"top_left":{"x":0,"y":47},"width":3992,"height":1996},"original":{"url":"https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F217221469%2F192538678939%2F1%2Foriginal.20220124-143922?auto=format%2Ccompress&q=75♯=10&s=4b490b30bc19f656c526f0480f155a33","width":3992,"height":2091},"id":"217221469","url":"https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F217221469%2F192538678939%2F1%2Foriginal.20220124-143922?h=200&w=450&auto=format%2Ccompress&q=75♯=10▭=0%2C47%2C3992%2C1996&s=427f41b341256ef934435594e81f3be9","aspect_ratio":"2","edge_color":"#aa9685","edge_color_set":true}}';
            res.setBody(responseString);
            res.setStatusCode(200);
            System.assertEquals('GET', req.getMethod());
            return res;
        }
    }
     //To validate API method is GET
    global class EventManagementError implements HttpCalloutMock {
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
