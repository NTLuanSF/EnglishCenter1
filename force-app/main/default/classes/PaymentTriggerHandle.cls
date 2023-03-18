public with sharing class PaymentTriggerHandle {
    //update finalamout = amout khi status = done và finalAmout = null
        public static void UpdateFinalAmout(List<Payment__c> newValues){
             for(Payment__c payment : newValues){
                if(payment.Status__c == 'Done' && payment.Final_Amount__c	== null){
                    payment.Final_Amount__c = payment.Amount__c;    
                }
             }
        }
        //không cho phép chuyển status từ Done sang các giá trị khác
        public static void throwMessageWhenChangeStatusDone(Map<Id, Payment__c> oldValues, List<Payment__c> newValues){
            for(Payment__c payment : newValues){
               if(payment.Status__c != 'Done' && oldValues.get(payment.Id).Status__c == 'Done'){
                payment.Status__c.addError('Không thể chuyển trạng thái từ done sang trạng thái khác.');
               }
            }
       }
       //tự động tạo task cho owner khi một payment được tạo ra với payment method là Chuyển Khoản
       public static void createNewTaskWhenCreatPayment(List<Payment__c> newValues){
        List<Task> tasks = new List<Task>();
        for(Payment__c payment : newValues){
            if (payment.Payment_method__c == 'Chuyển khoản') {
                Task task = new Task();
                task.Subject = 'Verify payment ' + payment.Name;
                task.Priority = 'High';
                task.OwnerId = payment.OwnerId;
                task.ActivityDate = payment.Payment_date__c.addDays(1);
                task.Status = 'Not Started';
                task.WhatId = payment.Id;
                tasks.add(task);
            }
        }
        insert tasks;
   }
}