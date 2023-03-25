trigger AutoUndateFinalAmountWhenNull on Payment__c (before insert, before update, after insert, after update) {
    if(trigger.isBefore && trigger.isInsert){
        PaymentTriggerHandle.UpdateFinalAmout(trigger.new);
    }

    if(trigger.isBefore && trigger.isUpdate){
        PaymentTriggerHandle.UpdateFinalAmout(trigger.new);
        PaymentTriggerHandle.throwMessageWhenChangeStatusDone(trigger.oldMap, trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        PaymentTriggerHandle.createNewTaskWhenCreatPayment(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isUpdate){
        //update Number of Payment
        QueueableTriggerHandlePayment myJob = new QueueableTriggerHandlePayment(trigger.new);
        System.enqueueJob(myJob);
        
    }
}