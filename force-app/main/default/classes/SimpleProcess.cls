public class SimpleProcess {
    public static void createContactWithError() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact c = new Contact(
            FirstName = 'Test',
            LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
            AccountId = acc.Id
        );

        try {
            insert c;
        } catch (Exception e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
}