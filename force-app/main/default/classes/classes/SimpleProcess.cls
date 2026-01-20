public class SimpleProcess {
    public static void createContact() {
        Contact newContact = new Contact();
        
        // Populate required fields
        newContact.FirstName = 'John';
        newContact.LastName = 'Doe';
        
        // Insert the contact
        insert newContact;
    }
}