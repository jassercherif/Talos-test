public class UpdateLeadError {
    public static void updateLeadWithError(Lead l, String errorMessage) {
        // Remove the line 'l.Id = null;' to fix the issue
        l.Description = errorMessage;
        update l;
    }
}