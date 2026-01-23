public class SimpleProcess {
    public void createContactWithError() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact c = new Contact(
            FirstName = 'John',
            LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
            AccountId = acc.Id
        );
        insert c;
    }
}