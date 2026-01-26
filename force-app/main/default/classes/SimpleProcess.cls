public class SimpleProcess {
    public void createContactWithError() {
        Contact c = new Contact();
        c.LastName = 'Test Contact';
        insert c;
    }
}