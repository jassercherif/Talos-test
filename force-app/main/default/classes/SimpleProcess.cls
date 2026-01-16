public class SimpleProcess {
    public static void createContactWithError() {
        Contact contact = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            Name = 'John Doe',
            AccountId = '001XXXXXXXXXXXX'
        );
        insert contact;
    }
}