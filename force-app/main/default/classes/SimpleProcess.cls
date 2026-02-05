public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Sample Contact'; // Assign required 'Name' field
        insert c;
    }
}