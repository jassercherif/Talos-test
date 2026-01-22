public with sharing class UpdateLeadError {
    public static void updateLeadWithError(Lead l) {
        if (Test.isRunningTest()) {
            l.Id = null; // Intentionally set ID to null for error demonstration in tests
        }
        try {
            update l;
        } catch (DmlException e) {
            System.debug('DML Exception caught: ' + e.getMessage());
            // Further error handling logic can be added here
        }
    }
}