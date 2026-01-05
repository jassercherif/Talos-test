public with sharing class UpdateLeadError {
    public static void updateLeadWithError() {

        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // -----------------------------------------------------------------
            // 1️⃣ Create a Lead (required fields only for the demo)
            // -----------------------------------------------------------------
            Lead l = new Lead(
                LastName = 'TestLead',
                Company  = 'TestCompany'
            );
            insert l;                         // DML #1 – succeeds

            // -----------------------------------------------------------------
            // 2️⃣ Delete the lead to create a realistic error scenario
            // -----------------------------------------------------------------
            delete l;

            // -----------------------------------------------------------------
            // 3️⃣ Try to update a deleted record - this will cause a real DML error
            // -----------------------------------------------------------------
            l.LastName = 'UpdatedAfterDelete';
            update l;                          // triggers a DmlException
        }
        catch (Exception ex) {

            // -----------------------------------------------------------------
            // 4️⃣ Build a log entry that captures the error details
            // -----------------------------------------------------------------
            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'UpdateLeadError',                         // Log Source
                'updateLeadWithError',                     // Function name
                new List<String>{
                    'Erreur lors de la mise à jour du Lead', // French error summary
                    'Message: ' + ex.getMessage()           // Actual exception message
                },
                ex.getStackTraceString(),                  // Full stack‑trace
                null,                                      // (optional) Parent Id
                'DmlException'                             // Log Type (custom picklist)
            );

            logs.add(log);                               // add to batch
        }

        // -----------------------------------------------------------------
        // 5️⃣ Persist the log(s) – this is the observable side‑effect
        // -----------------------------------------------------------------
        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}