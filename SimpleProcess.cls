public class SimpleProcess {
    public static Contact createContactWithError(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName; // Ensure FirstName is populated
        newContact.LastName = lastName;   // Ensure LastName is populated
        newContact.Email = email;
        
        try {
            insert newContact;
            return newContact;
        } catch (DmlException e) {
            System.debug('Error creating contact: ' + e.getMessage());
            // Optionally re-throw or handle the exception as per business logic
            throw e;
        }
    }
}