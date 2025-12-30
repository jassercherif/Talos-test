public class SimpleProcess {
    public static void createAccountAndContact() {
        try {
            // Fixed: Added required Name field to Account constructor
            Account acc = new Account(Name = 'Test Account', AccountNumber = '123');
            insert acc;
            
            // This will fail due to LastName length validation
            Contact con = new Contact(LastName = 'ThisLastNameIsWayTooLongToBeValidAndWillCauseAnErrorWhenInserted', AccountId = acc.Id);
            insert con;
        } catch(Exception e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
}