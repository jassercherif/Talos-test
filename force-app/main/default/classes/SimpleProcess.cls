public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Test Contact';
        c.Phone = '1234567890';
        c.Email = 'test@example.com';
        insert c;
    }
}