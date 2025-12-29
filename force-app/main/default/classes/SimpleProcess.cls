public with sharing class SimpleProcess {
 
    public static void createContactWithError() {
 
        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();
 
        try {
            // On crée un compte standard avec le champ Name requis
            Account acc = new Account(
                Name = 'Test Account',
                AccountNumber = '123'
            );
            insert acc;
 
            // Contact volontairement erroné (LastName trop long)
            Contact c = new Contact(
                LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
                AccountId = acc.Id
            );
 
            insert c; // va déclencher une erreur
 
        } catch (Exception ex) {
 
            // Construction du log
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
 
        // insertion du log si nécessaire
        if (!logs.isEmpty()) {
            insert logs;
        }
    }
}