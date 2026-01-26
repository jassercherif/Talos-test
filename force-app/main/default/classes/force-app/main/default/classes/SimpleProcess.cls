public class SimpleProcess {
    public void createContactWithError() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact c = new Contact(LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur', FirstName = 'Test', AccountId = acc.Id);
        insert c;
    }
}