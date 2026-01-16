public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact(
            LastName = 'Test',
            FirstName = 'Test'  // Added FirstName to resolve REQUIRED_FIELD_MISSING error
        );
        insert c;
    }
}