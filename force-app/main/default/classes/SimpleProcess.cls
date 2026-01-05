public class SimpleProcess {
    // Method to test error handling for Contact creation
    public static void testContactCreationErrorHandling() {
        // This error is intentional for testing error handling
        try {
            Contact c = new Contact();
            insert c; // This will fail because the Name field is required
        } catch (Exception e) {
            System.debug('Expected error: Contact creation failed due to missing required field - ' + e.getMessage());
        }
    }
}