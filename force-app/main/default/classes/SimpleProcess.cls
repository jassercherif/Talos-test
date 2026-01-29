public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.LastName = 'Test Contact'; // Initialize the 'LastName' field
        insert c;
    }
}