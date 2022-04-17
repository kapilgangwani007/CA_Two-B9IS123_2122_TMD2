public class EventGetOrganisationId {
	@AuraEnabled
	public static String getOrganisationId() {
		String userDetails = '';
		EventUserOrgWrapper orgObj = new EventUserOrgWrapper();
		EventShowWrapper toShowInUI = new EventShowWrapper();
		try {
			///https://www.eventbriteapi.com/v3/users/me/organizations/?token=XZF6XPYXRASKPB2RPTU3#
			String url = 'https://www.eventbriteapi.com/v3/users/me/organizations';
			String apiKey = 'XZF6XPYXRASKPB2RPTU3'; //Eventbrite API Key
			String apiURL = '/?token=';
			String apiStatusCode = '';
			String apiRequest = '';
			String endpointURL = url + apiURL + apiKey;
			System.debug('endpointURL::' + endpointURL);
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
			if (res.getStatusCode() == 200) {
				String JSONResponse = res.getBody().replace('_type', 'type');
				orgObj = (EventUserOrgWrapper)System.JSON.deserialize(JSONResponse,
								EventUserOrgWrapper.class);
				System.debug('@@orgObj::' + orgObj);
				List<EventUserOrgWrapper.cls_organizations> orgDataList = orgObj.organizations;
				toShowInUI.userName = orgDataList[0].name;
				toShowInUI.userId = orgDataList[0].id;
			}

			toShowInUI.apiResponse = res.getBody();
			toShowInUI.apiEndpointURL = endpointURL;
			toShowInUI.apiMethod = 'GET';
			toShowInUI.apiStatusCode = String.valueOf(res.getStatusCode());
			toShowInUI.apiRequest = apiRequest;
			System.debug('res.getStatusCode() null: ' + res.getStatusCode());
		} catch (Exception exp) {
			System.debug('@@Exception Occurred : ' + exp.getStackTraceString());
		}

		return JSON.serialize(toShowInUI);

	}
}