public class UpdateLeadHandler {
    public static void updateLeadWithError(Id leadId) {
        if (leadId == null || leadId == '') {
            throw new IllegalArgumentException('Id not specified in an update call');
        }
        // Existing logic...
    }
}