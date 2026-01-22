public with sharing class UpdateLeadError {

    /**
     * @description Intentionally creates a Lead and then causes an update error
     *              by setting the Id to null. This is used to test error logging
     *              functionality.
     */
    public static void updateLeadWithError() {
        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // Create a Lead with required fields
            Lead l = new Lead(
                LastName = 'TestLead',
                Company = 'TestCompany'
            );
            insert l;

            // INTENTIONAL ERROR: This line causes a MISSING_ARGUMENT error
            // by removing the Id before the update call
            l.Id = null;
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