trigger ApplicationLogTrigger on ApplicationLog__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        List<Id> newIds = new List<Id>();
        for (ApplicationLog__c al : Trigger.new) {
            if (al.Id != null) newIds.add(al.Id);
        }
        if (!newIds.isEmpty()) {
            ApplicationLogWebHookCaller.callFlaskWebhook(newIds);
        }
    }
}
