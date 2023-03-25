trigger UpdateFieldNumberofContactInAccount on Contact (after insert, after delete) {
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
            ContactTriggerHandle.updateNumberOfContact(accountIds);
}