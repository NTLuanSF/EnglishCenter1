public class ContactTriggerHandle {
    
    @future
    public static void updateNumberOfContact(List<Id> accountId){
        List<Account> accountList = new List<Account>();
        for(Account acc : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id = :accountId]){
            acc.Number_of_Contacts__c = acc.Contacts.size();
            accountList.add(acc);
        }
        update accountList;
    }
    @future (callout=true)
    public static void UpdateDataFromExtenalSystem(List<Id> contactIds){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        List<Contact> contacts = [Select Id, Name, Email, Phone, Website__c, Username__c, Account.Name, userId__c, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry  From Contact where Id =: contactIds];
        for(Contact ct : contacts){
        String requestBody = '{"name":"' + ct.Name + '" , "email": "' + ct.Email + '" , ' +
        '"phone":"' + ct.Phone +'",  "website":"' + ct.Website__c +'",  ' +
        '"username":"' + ct.Username__c +'", "address": {"street": "' + ct.MailingStreet + '", "city" : "' + ct.MailingCity + '" , "zipcode" : "' + ct.MailingPostalCode + '" },  "company": { "name" :"' + ct.Account.name + '"}}'; 
        
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/' + ct.userId__c);
        request.setMethod('PATCH');
        request.setHeader('Content-Type', 'application/json');
        request.setBody(requestBody); 
        
        HTTPResponse response = http.send(request);
            
        if (response.getStatusCode() == 200) {
           Map<String, Object> updatedContact = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
           system.debug(updatedContact);
        }
        else {
            System.debug('Error updating data: ' + response.getStatus());
        }
        }
        
    }
}