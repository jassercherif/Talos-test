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

            // Force an error: updating Id is invalid
            l.Id = null;
            Database.SaveResult result = Database.update(l, false);
            if (!result.isSuccess()) {
                // Log error with 'Erreur' message
                for(Database.Error err : result.getErrors()) {
                    System.debug('Erreur: ' + err.getMessage());
                }
            }

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