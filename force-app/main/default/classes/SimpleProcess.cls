public class SimpleProcess {
    public static void createContactWithError() {
        Contact newContact = new Contact();
        newContact.LastName = 'DefaultLastName';
        // Existing code...
        insert newContact;
    }
}