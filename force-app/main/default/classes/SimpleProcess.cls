public class SimpleProcess {
    public static void createAccount() {
        Account acc = new Account(Name = 'Test Account', AccountNumber = '123');
        insert acc;
    }
}