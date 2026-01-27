public class SimpleProcess {
    public static void createContactWithError() {
        try {
            // This line will cause an error because LastName is required
            Contact newContact = new Contact();
            newContact.FirstName = 'Test';
            newContact.LastName = 'Default Last Name';
            insert newContact;
        } catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage());
        }
    }
}