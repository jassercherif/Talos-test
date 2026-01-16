public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Name = 'John Doe'
        );
        insert c;
    }
}