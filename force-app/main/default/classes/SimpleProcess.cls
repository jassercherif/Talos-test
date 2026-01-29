public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.FirstName = 'John';
        c.LastName = 'Doe';
        c.Email = 'john.doe@example.com';
        c.Phone = '123-456-7890';
        insert c;
    }
}