public class QueueableTriggerHandlePayment implements Queueable {
    public List<Payment__c> paymentList;
    
    public QueueableTriggerHandlePayment(List<Payment__c> input){
        this.paymentList = input;
    }
    
 public void execute(QueueableContext context) {
     list<Account> accountList = new List<Account>();
     List<Id> accountIds = new List<Id>();
     
     for(Payment__c pm : paymentList){
         accountIds.add(pm.Account__c);
     }
     system.debug(accountIds);
     for(Account acc : [Select Id, (Select Id, Name from Payments__r where Status__c = 'Done') FROM Account Where Id IN :accountIds ]){
         acc.Number_of_Payment__c = acc.Payments__r.size();
         system.debug(acc.Number_of_Payment__c);
     }
     update(accountList);
    }
}