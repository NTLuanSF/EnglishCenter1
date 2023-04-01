trigger UpdateFieldNumberofContactInAccount on Contact (after insert, after delete, after update) {
    List<Id> accountIds = new List<Id>();
    if(trigger.isAfter && trigger.isInsert){
        for(Contact ct : trigger.new) {
            accountIds.add(ct.AccountId);
        }
    }
    if(trigger.isAfter && trigger.isDelete){
        for(Contact ct : trigger.old) {
            accountIds.add(ct.AccountId);
        }
    }
    if(accountIds.size() > 0){
        ContactTriggerHandle.updateNumberOfContact(accountIds);
    }
    

    if(trigger.isAfter && trigger.isUpdate){
        List<Id> contactId = new List<Id>();

        
        for(Contact ct : Trigger.new){
            Contact oldCon = Trigger.oldMap.get(ct.Id);
            if (ct.UserId__c != oldCon.UserId__c) {
                contactId.add(ct.Id);
            }  
            
        }
        system.debug(contactId);
        ContactTriggerHandle.UpdateDataFromExtenalSystem(contactId);
    }
} 