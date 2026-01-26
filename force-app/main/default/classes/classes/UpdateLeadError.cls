public class UpdateLeadError {
    public static void updateLeadWithError(Lead l, String errorMessage) {
        l.Description = errorMessage;
        update l;
    }
}