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
        update l;
    } catch (Exception ex) {
        // ... error handling
    }
}