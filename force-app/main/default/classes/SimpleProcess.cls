public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact(
            FirstName = 'Test',
            LastName = 'User',  // Added missing LastName field
            Email = 'test@example.com'
        );
        insert c;
    }
}