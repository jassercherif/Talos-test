public class UpdateLeadError {
    public static void updateLeadWithError(Lead l) {
        try {
            // This will cause an error because we're setting Id to null
            // But we want to demonstrate proper error handling
            l.Id = null; // This line intentionally causes an error for demonstration
            update l;
        } catch(Exception e) {
            // Create an error log record
            ApplicationLog__c log = new ApplicationLog__c(
                Message__c = 'Erreur: ' + e.getMessage(),
                StackTrace__c = e.getStackTraceString(),
                LogType__c = 'Error'
            );
            insert log;
            
            // Re-throw the exception to maintain original behavior
            // but ensure the log is created first
            throw e;
        }
    }
}