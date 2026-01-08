public class UpdateLeadError {
    public static void updateLeadWithError(Id leadId) {
        Lead l = [SELECT Id, Name FROM Lead WHERE Id = :leadId LIMIT 1];
        try {
            // Remove the intentional error simulation
            update l;
        } catch (Exception e) {
            System.debug('Error updating lead: ' + e.getMessage());
        }
    }
}