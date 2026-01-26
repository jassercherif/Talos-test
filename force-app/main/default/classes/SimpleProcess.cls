public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Contact';
        insert c;
    }
}