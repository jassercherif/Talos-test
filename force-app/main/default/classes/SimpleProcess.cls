public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Default Contact'; // Fix: Set required Name field
        insert c;
    }
}