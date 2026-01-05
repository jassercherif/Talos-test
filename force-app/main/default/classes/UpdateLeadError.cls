public with sharing class UpdateLeadError {
    public static void updateLeadWithError() {
        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();
        
        try {
            // Create a Lead with required fields but no Id
            Lead l = new Lead(
                LastName = 'TestLead',
                Company = 'TestCompany'
            );
            // Intentionally do NOT insert or set Id
            // Attempt to update a Lead that doesn't exist
            update l;
            
        } catch (Exception ex) {
            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'UpdateLeadError',
                'updateLeadWithError',
                new List<String>{
                    'Erreur lors de la mise à jour du Lead',
                    'Message: ' + ex.getMessage()
                },
                ex.getStackTraceString(),
                null,
                'DmlException'
            );
            logs.add(log);
        }
        
        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}