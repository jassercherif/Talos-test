public class SimpleProcess {
    public static void createContactWithError(Contact contact) {
        if (String.isEmpty(contact.LastName)) {
            contact.LastName = 'Doe';
        }
        try {
            insert contact;
        } catch (DmlException e) {
            // Handle error
        }
    }
}