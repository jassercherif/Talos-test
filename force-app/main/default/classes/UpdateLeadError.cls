public class UpdateLeadError {
    public static void updateLead(Lead l) {
        try {
            // Simulate an error by throwing a custom exception
            throw new CustomException('Simulated update error for demonstration');
        } catch (Exception e) {
            System.debug('Error updating lead: ' + e.getMessage());
        }
    }

    public class CustomException extends Exception {}
}