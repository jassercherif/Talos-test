public class SimpleProcess {
    public static void createContactWithError(Account acc) {
        Contact c = new Contact(
            FirstName = 'Test',
            LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
            AccountId = acc.Id
        );
        insert c;
    }
}