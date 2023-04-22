@istest
public class Test_TriggerNumberOfContact {
    //test update number_of_contact__c khi thêm mới contact
  @TestSetup 
    public static void TestNumberOfContact(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        
        test.startTest();
        List<Contact> contactList = new List<Contact>();
        for(integer i = 0 ; i < 50 ; i++){
            Contact ct = new Contact();
            ct.AccountId = acc.Id;
            ct.LastName = 'last Name ' + i;
            contactList.add(ct);
        }
        insert contactList;    
        test.stopTest();
        
        Account ac = [SELECT Id , Number_of_Contacts__c FROM Account WHERE Id =: acc.Id];
        system.Assert(contactList.size() == ac.Number_of_Contacts__c);
        
    }
    
    //test update number_of_contact__c khi xóa contact
    @istest
    public static void TestNumberOfContactWhenDelete(){
        Account acc = [SELECT Id, Name, Number_of_Contacts__c FROM Account];
        system.debug(acc.Name);
        List<Contact> ctl = [SELECT Id FROM Contact WHERE AccountId =: acc.Id];
        Test.startTest();
        Delete ctl;
        Test.stopTest();
        Account acc2 = [SELECT Id, Name, Number_of_Contacts__c FROM Account];
        system.Assert(acc2.Number_of_Contacts__c == 0);
    }
}