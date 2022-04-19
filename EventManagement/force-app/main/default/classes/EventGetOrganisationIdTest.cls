@isTest
global class EventGetOrganisationIdTest {
	//To validate all values are blank in return value
	@isTest static void getOrgIdTest() {
		String result = EventGetOrganisationId.getOrganisationId();
		System.debug('result: ' + result);
		String expectedResult =
				'{"venue_id":null,"userName":null,"userId":null,"url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":null,"apiResponse":null,"apiRequest":null,"apiMethod":null,"apiEndpointURL":null}';
		System.assertEquals(result, expectedResult, 'All values are blank');
	}


	// To validate result in not blank
	@isTest static void eventOrgIdSuccessTest() {
		String expectedResult =
				'{"venue_id":null,"userName":"Kapil Gangwani","userId":"908029239533","url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":"200","apiResponse":"{\"organizations\":[{\"_type\":\"organization\",\"name\":\"Kapil Gangwani\",\"vertical\":\"default\",\"parent_id\":null,\"locale\":null,\"image_id\":null,\"id\":\"908029239533\"}],\"pagination\":{\"object_count\":1,\"continuation\":\"AGWl1yGxIuu0cCNu0CIFIg3qC84141rjizPKOK5XW3reLQl31crnuTHSAdy9oqgyK4OvqB4ekrmK\",\"page_count\":1,\"page_size\":50,\"has_more_items\":false,\"page_number\":1}}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/users/me/organizations/?token=XZF6XPYXRASKPB2RPTU3, Method=GET]","apiMethod":"GET","apiEndpointURL":"https://www.eventbriteapi.com/v3/users/me/organizations/?token=XZF6XPYXRASKPB2RPTU3"}';
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new EventGetOrganisationIdSuccess());

		String result = EventGetOrganisationId.getOrganisationId();
		System.assert(result != null, 'Result should not be null');
		Test.StopTest();
	}
	// To validate result in not blank
	@isTest static void eventOrgIdErrorTest() {
		String eventId = '';
		Test.startTest();
		Test.setMock(HttpCalloutMock.class, new EventGetOrganisationIdError());
		String result = EventGetOrganisationId.getOrganisationId();
		System.assert(result != null, 'Result should not be null');
		Test.StopTest();
	}


	global class EventGetOrganisationIdSuccess implements HttpCalloutMock {
		global HTTPResponse respond(HTTPRequest req) {
			HttpResponse res = new HttpResponse();
			res.setHeader('Content-Type', 'application/json');
			String responseString =
					'{"venue_id":null,"userName":"Kapil Gangwani","userId":"908029239533","url":null,"summary":null,"status":null,"startTime":null,"organization_id":null,"eventName":null,"eventId":null,"endTime":null,"description":null,"currencys":null,"apiStatusCode":"200","apiResponse":"{\"organizations\":[{\"_type\":\"organization\",\"name\":\"Kapil Gangwani\",\"vertical\":\"default\",\"parent_id\":null,\"locale\":null,\"image_id\":null,\"id\":\"908029239533\"}],\"pagination\":{\"object_count\":1,\"continuation\":\"AGWl1yGxIuu0cCNu0CIFIg3qC84141rjizPKOK5XW3reLQl31crnuTHSAdy9oqgyK4OvqB4ekrmK\",\"page_count\":1,\"page_size\":50,\"has_more_items\":false,\"page_number\":1}}","apiRequest":"System.HttpRequest[Endpoint=https://www.eventbriteapi.com/v3/users/me/organizations/?token=XZF6XPYXRASKPB2RPTU3, Method=GET]","apiMethod":"GET","apiEndpointURL":"https://www.eventbriteapi.com/v3/users/me/organizations/?token=XZF6XPYXRASKPB2RPTU3"}';
			res.setBody(responseString);
			res.setStatusCode(200);
			System.assertEquals('GET', req.getMethod());
			return res;
		}
	}
	//To validate API method is GET
	global class EventGetOrganisationIdError implements HttpCalloutMock {
		global HTTPResponse respond(HTTPRequest req) {
			HttpResponse res = new HttpResponse();
			res.setHeader('Content-Type', 'application/json');
			String responseString =
					'{"status_code": 401,"error_description": "The OAuth token you provided was invalid.","error": "INVALID_AUTH"}';
			res.setBody(responseString);
			res.setStatusCode(404);
			System.assertEquals('GET', req.getMethod());
			return res;
		}
	}
}