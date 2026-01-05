public with sharing class SimpleProcess {

    public static void createContactWithError() {
        createContactWithError('NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur', null);
    }

    public static void createContactWithError(String lastName, String accountId) {
        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            if (String.isBlank(lastName)) {
                throw new IllegalArgumentException('LastName is required');
            }

            Account acc;
            if (String.isBlank(accountId)) {
                acc = new Account(AccountNumber = '123');
                insert acc;
            } else {
                acc = [SELECT Id FROM Account WHERE Id = :accountId LIMIT 1];
            }

            Contact c = new Contact(
                LastName = lastName,
                Name = lastName,
                AccountId = acc.Id
            );

            insert c;

        } catch (Exception ex) {
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

        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}