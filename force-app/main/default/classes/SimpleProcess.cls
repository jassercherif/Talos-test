public class SimpleProcess {
    public static void createContactWithError(String contactName) {
        if (String.isBlank(contactName)) {
            throw new IllegalArgumentException('Contact Name cannot be blank');
        }
        Contact newContact = new Contact(Name = contactName);
        try {
            insert newContact;
        } catch (DmlException e) {
            System.debug('Error creating contact: ' + e.getMessage());
            throw e;
        }
    }
}