public with sharing class SimpleProcess {

    public static void createContactWithError() {

        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // Create an account with the required Name field
            Account acc = new Account(
                AccountNumber = '123',
                Name = 'Test Account' // Added required Name field
            );
            insert acc;

            // Intentionally erroneous contact (LastName too long)
            Contact c = new Contact(
                LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
                AccountId = acc.Id
            );

            insert c; // This will still trigger an error as intended

        } catch (Exception ex) {

            // Build the log
            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'SimpleProcess',
                'createContactWithError',
                new List<String>{
                    'Erreur lors de la création du contact',
                    'Message: ' + ex.getMessage()
                },
                ex.getStackTraceString(),
                null,
                'Erreur Contact'
            );

            logs.add(log);
        }
        // Insert the log if necessary
        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}