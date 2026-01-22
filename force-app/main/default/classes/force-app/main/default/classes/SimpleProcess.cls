public class SimpleProcess {
    public static void createContactWithError(Id accountId) {
        Account acc = [SELECT Id FROM Account WHERE Id = :accountId];
        Contact c = new Contact(
            FirstName = 'Test',
            LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreurABCDEFGHIJKLMNO',
            AccountId = acc.Id
        );
        insert c;
    }
}