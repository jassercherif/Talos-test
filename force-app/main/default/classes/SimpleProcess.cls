public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        // Assign required Name field
        c.Name = 'Test Contact';
        // Validate Name before insertion
        if (String.isNotBlank(c.Name)) {
            insert c;
        } else {
            System.debug('Contact Name is required');
        }
    }
}