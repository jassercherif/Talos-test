public class UpdateLeadError {
    public static void updateLeadWithError(Id leadId) {
        if (leadId == null) {
            System.debug('Error: Lead ID is required for update operation');
            return;
        }
        Lead lead = [SELECT Id, Name FROM Lead WHERE Id = :leadId LIMIT 1];
        lead.Name = 'Updated Name';
        update lead;
    }
}