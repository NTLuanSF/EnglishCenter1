@istest
public class ScheduleTotalFinalAmountPaymentTest {
   @istest
    public static void testScheduleDaily(){
        ScheduleTotalFinalAmountPayment schedule = new ScheduleTotalFinalAmountPayment();
        String scheduleExpression = '0 0 7 * * ? 2023';
        system.schedule('My Job', scheduleExpression, schedule);

    }
}