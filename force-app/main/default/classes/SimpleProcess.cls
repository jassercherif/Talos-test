public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Test Contact'; // Assign required 'Name' field
        insert c;
    }
}