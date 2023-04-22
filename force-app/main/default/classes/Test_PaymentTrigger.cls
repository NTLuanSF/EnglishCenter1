@isTest
public class Test_PaymentTrigger {
    @istest
    public static void TestAutoUpdateFinalAmount(){
        Payment__c pm = New Payment__c();
        pm.Name = 'Test Auto Create Amount';
        pm.Status__c = 'New';
        pm.Amount__c = 50000;
        insert pm;
        
        Test.startTest();
        pm.Status__c = 'Done';
        update pm;
        Test.stopTest();
        Payment__c p = [SELECT Id, Name, Final_Amount__c FROM Payment__c WHERE Id =: pm.Id];
        system.Assert(p.Final_Amount__c == 50000);
    }
}