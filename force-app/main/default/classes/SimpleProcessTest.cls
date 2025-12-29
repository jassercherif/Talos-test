@isTest
public class SimpleProcessTest {
    @isTest
    static void testProcessAccountsSuccess() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;

        Test.startTest();
        SimpleProcess.processAccounts(testAccounts);
        Test.stopTest();

        List<Account> updatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :testAccounts];
        System.assertEquals(5, updatedAccounts.size(), 'All accounts should be updated.');
    }

    @isTest
    static void testProcessAccountsEmptyList() {
        try {
            SimpleProcess.processAccounts(new List<Account>());
            System.assert(false, 'Expected exception for empty list.');
        } catch (SimpleProcess.SimpleProcessException e) {
            System.assert(e.getMessage().contains('No accounts provided'), 'Exception message should match.');
        }
    }

    @isTest
    static void testProcessAccountsBlankName() {
        Account testAccount = new Account(Name = '');
        try {
            SimpleProcess.processAccounts(new List<Account>{testAccount});
            System.assert(false, 'Expected exception for blank name.');
        } catch (SimpleProcess.SimpleProcessException e) {
            System.assert(e.getMessage().contains('Account Name cannot be blank'), 'Exception message should match.');
        }
    }

    @isTest
    static void testProcessAccountsBulk() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            testAccounts.add(new Account(Name = 'Bulk Test Account ' + i));
        }
        insert testAccounts;

        Test.startTest();
        SimpleProcess.processAccounts(testAccounts);
        Test.stopTest();

        List<Account> updatedAccounts = [SELECT Id, Name FROM Account WHERE Id IN :testAccounts];
        System.assertEquals(200, updatedAccounts.size(), 'All bulk accounts should be updated.');
    }
}