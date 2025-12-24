public with sharing class SimpleProcess {

    public static void createContactWithError() {

        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // Create an Account with both AccountNumber and Name
            Account acc = new Account(
                AccountNumber = '123',
                Name = 'Sample Account Name'
            );
            insert acc;

            // Contact intentionally erroneous (LastName too long)
            Contact c = new Contact(
                LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
                AccountId = acc.Id
            );

            insert c; // will trigger an error

        } catch (Exception ex) {

            // Build the log
            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'SimpleProcess',
                'createContactWithError',
                new List<String>{
                    'Error during contact creation',
                    'Message: ' + ex.getMessage()
                },
                ex.getStackTraceString(),
                null,
                'Contact Error'
            );

            logs.add(log);
        }

        // Insert log if necessary
        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}