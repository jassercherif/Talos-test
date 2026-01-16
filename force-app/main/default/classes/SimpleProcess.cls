public class SimpleProcess {
    public static void createContactWithError() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        Contact con = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = acc.Id
        );
        insert con;
    }
}