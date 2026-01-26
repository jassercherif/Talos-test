public class SimpleProcess {
    public static void createContactWithError() {
        // Existing code to create Account, if any
        Account acc = new Account();
        acc.Name = 'Default Account Name'; // Add this line or ensure Name is set
        // ... other Account field assignments ...
        insert acc; // This line was causing the error

        Contact con = new Contact();
        con.LastName = 'Test Contact';
        con.AccountId = acc.Id;
        insert con;
    }
}