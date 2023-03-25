public class ScheduleTotalFinalAmountPayment implements Schedulable {
  public void execute(SchedulableContext SC) {
        BatchJobTotalThisMonthPaymentAmount batch = new BatchJobTotalThisMonthPaymentAmount();
        Database.executeBatch(batch);
    }
} 