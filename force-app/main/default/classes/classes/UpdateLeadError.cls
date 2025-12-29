public class UpdateLeadError {
    public static void updateLeadWithError() {
        Lead l = new Lead(FirstName='Test', LastName='Lead', Company='Test Company');
        insert l;
        
        try {
            // This will cause an error because we're setting Id to null before update
            l.Id = null;
            update l;
        } catch(Exception e) {
            // Create an ApplicationLog__c record using the existing pattern
            ApplicationLogPython.buildApplicationLog(
                'UpdateLeadError',
                'Error updating lead: ' + e.getMessage(),
                'ERROR',
                'UpdateLeadError.updateLeadWithError'
            );
        }
    }
}