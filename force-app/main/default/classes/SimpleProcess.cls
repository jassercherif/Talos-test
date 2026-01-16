public class SimpleProcess {
    public static void createContactWithError() {
        // Create Account with required Name field
        Account a = new Account(
            Name = 'Test Account',  // Added required Name field
            AccountNumber = 'ACC-001'
        );
        insert a;
        
        // Create Contact with required FirstName field
        Contact c = new Contact(
            FirstName = 'John',  // Added required FirstName field
            LastName = 'Doe',
            AccountId = a.Id
        );
        insert c;
    }
}