public with sharing class SimpleProcess {
    public static void execute() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        createContactWithError(acc);
    }

    private static void createContactWithError(Account acc) {
        Contact c = new Contact(
            FirstName = 'Default',
            LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
            AccountId = acc.Id
        );
        insert c;
    }
}