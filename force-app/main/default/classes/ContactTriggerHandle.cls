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
}