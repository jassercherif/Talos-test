public class SimpleProcess {
    public static void createContactWithError(Contact contact) {
        try {
            // Check if Name is missing
            if (String.isEmpty(contact.Name)) {
                String message = 'Contact Name is required.';
                System.debug(message);
                return;
            }
            // Proceed with insertion
            insert contact;
        } catch (DmlException e) {
            System.debug('DML Exception: ' + e.getMessage());
            // Handle other exceptions if needed
        }
    }
}