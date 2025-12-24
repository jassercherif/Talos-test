public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        // Fix: Populate the required Name field before insertion
        c.LastName = 'Default Name';
        insert c;
    }
}