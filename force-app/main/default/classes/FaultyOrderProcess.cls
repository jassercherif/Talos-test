public with sharing class FaultyOrderProcess {

    public static void createContactWithError() {

        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // Create Account with missing required Name field (intentional error)
            Account acc = new Account();
            insert acc; // ❌ REQUIRED_FIELD_MISSING

            // Will never be reached
            Contact c = new Contact(
                LastName = 'Test',
                AccountId = acc.Id
            );
            insert c;

        } catch (Exception ex) {

            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'FaultyOrderProcess',
                'createContactWithError',
                new List<String>{
                    'Error during Account / Contact creation',
                    'Exception message: ' + ex.getMessage()
                },
                ex.getStackTraceString(),
                null,
                'Account error'
            );

            logs.add(log);
        }

        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}
