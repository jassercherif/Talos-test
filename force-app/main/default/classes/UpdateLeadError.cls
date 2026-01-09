public with sharing class UpdateLeadError {

    public static void updateLeadWithError() {
        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // Create a Lead with required fields
            Lead l = new Lead(
                LastName = 'TestLead',
                Company = 'TestCompany'
            );
            insert l;

            // Update the Lead with valid Id
            l.LastName = 'UpdatedLead';
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