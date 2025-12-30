public with sharing class FaultyOpportunityProcess {

    public static void createOpportunityWithError() {

        List<ApplicationLog__c> logs = new List<ApplicationLog__c>();

        try {
            // 1️⃣ Create Account (valid)
            Account acc = new Account(Name = 'Business Account');
            insert acc;

            // 2️⃣ Create Opportunity (FAULTY)
            // ❌ CloseDate is required → real business error
            Opportunity opp = new Opportunity(
                Name = 'New Business Opportunity',
                StageName = 'Prospecting',
                AccountId = acc.Id
            );

            insert opp; // ❌ REQUIRED_FIELD_MISSING

        } catch (Exception ex) {

            ApplicationLog__c log = ApplicationLogPython.buildApplicationLog(
                'FaultyOpportunityProcess',
                'createOpportunityWithError',
                new List<String>{
                    'Error while creating Opportunity',
                    'Exception message: ' + ex.getMessage()
                },
                ex.getStackTraceString(),
                accIdSafe(),
                'Opportunity error'
            );

            logs.add(log);
        }

        if (!logs.isEmpty()) {
            insert logs;
        }
    }

    // Helper to avoid null issues in logging
    private static String accIdSafe() {
        return null;
    }
}
