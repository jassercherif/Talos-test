public class SimpleProcess {
    public static void createContactWithError() {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        Contact c = new Contact();
        c.AccountId = a.Id;
        String longLastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur';
        c.LastName = longLastName.length() > 80 ? longLastName.substring(0, 80) : longLastName;
        insert c;
    }
}