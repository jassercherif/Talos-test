public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Test Contact';
        // Other fields...
        insert c;
    }
}