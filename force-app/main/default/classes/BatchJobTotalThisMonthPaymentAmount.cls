public class BatchJobTotalThisMonthPaymentAmount implements Database.Batchable<sObject>{
  public Database.QueryLocator start(Database.BatchableContext context) {
        Integer currentMonth = Date.today().month();
        Integer currentYear = Date.today().Year();
        string Query = 'SELECT Id, Name, This_Month_Total_Payment_Amount__c, (SELECT Id, Name, Final_Amount__c, Payment_date__c  FROM Payments__r where CALENDAR_MONTH(Payment_date__c) = ' + currentMonth + ' AND CALENDAR_YEAR(Payment_date__c) = ' + currentYear + ') FROM Account';
        return Database.getQueryLocator(Query);
    }
    public void execute(Database.BatchableContext context, List<Account> accountList) {
        List<Account> accList = new List<Account>();
        for(Account acc : accountList ){  
            Double totalAmount = 0;
                for(Payment__c pm : acc.Payments__r){
                if(pm.Final_Amount__c > 0){
                    totalAmount += pm.Final_Amount__c;
                }
            }
            acc.This_Month_Total_Payment_Amount__c = totalAmount;
            accList.add(acc);
            }
        update accList;
    }
    public void finish(Database.BatchableContext context) {
        System.debug('Batch job finished successfully!');
    }
}