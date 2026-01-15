public class UpdateLeadError {
    public static void updateLeadWithError(Lead l) {
        try {
            update l;
        } catch (Exception e) {
            System.debug('Error updating lead: ' + e.getMessage());
        }
    }
}