public class UpdateLeadError {
    public static void updateLeadWithErrorHandling(Lead leadToUpdate) {
        try {
            update leadToUpdate;
        } catch (Exception e) {
            System.debug('Error updating lead: ' + e.getMessage());
        }
    }
}