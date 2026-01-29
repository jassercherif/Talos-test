trigger ExmpTrigger on Exmp__c (after update) {
    ExmpTriggerHandler.handleAfterUpdate(Trigger.oldMap, Trigger.newMap);
}
