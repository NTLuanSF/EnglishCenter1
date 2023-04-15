@RestResource(urlMapping='/v1/Case/*')
global class CustomApiWithCase {
    //get case by case Number
    //https://tngcngtycngnghvgiiphpcmccm4-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Case/{CaseNumber}
    @HttpGet
    global static Case doGet() {
        RestRequest req = RestContext.request;
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Case result = [SELECT Id, Subject, Status FROM Case WHERE CaseNumber = :CaseNumber];
        return result;
    }
    // Create case
    //https://tngcngtycngnghvgiiphpcmccm4-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Case/
    @HttpPost
    global static String doPost(String subject, String status) {
        Case c = new Case();
        c.Subject = subject;
        c.Status = status;
        try {
            insert c;
            return c.Id;
        } catch(DmlException e){
            system.debug(e.getMessage());
        }
        return c.Id;
    }
    //https://tngcngtycngnghvgiiphpcmccm4-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Case/{Id}
    @HttpPatch
    global static String UpdateCaseField() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        system.debug(params);
        for(String fieldName : params.keySet()) {
            thisCase.put(fieldName, params.get(fieldName));
        }
        try {
            system.debug(thisCase);	
   		update thisCase;
            
     	} catch (DmlException e) {
            system.debug(e.getMessage());
		}
        return thisCase.Id;
    }
    
    // https://tngcngtycngnghvgiiphpcmccm4-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Case/
    @HttpPut
    global static ID upsertCase() {
        RestRequest request = RestContext.request;
        Case thisCase = new Case();
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        for(String fieldName : params.keySet()) {
            thisCase.put(fieldName, params.get(fieldName));
        }	
        try {
   		upsert thisCase;   
     	} catch (DmlException e) {
            system.debug(e.getMessage());
		}
        return thisCase.Id;
    }
    
    // https://tngcngtycngnghvgiiphpcmccm4-dev-ed.develop.my.salesforce.com/services/apexrest/v1/Case/{CaseNumber}
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        String CaseNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE CaseNumber = :CaseNumber];
        try {
   		delete thisCase;
     	} catch (DmlException e) {
            system.debug(e.getMessage());
		}
    }
    
}