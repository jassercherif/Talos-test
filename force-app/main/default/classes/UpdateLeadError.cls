public class UpdateLeadError {
    public static void updateLeadWithError(Lead lead) {
        try {
            if (lead.Id == null) {
                insert lead;
            } else {
                update lead;
            }
        } catch (Exception e) {
            System.debug("Error updating lead: " + e.getMessage());
        }
    }
}