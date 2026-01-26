@isTest
public class SimpleProcessTest {
    @isTest
    static void testCreateContactWithError() {
        Test.startTest();
        SimpleProcess.createContactWithError();
        Test.stopTest();

        // Verify that the Contact was created successfully
        List<Contact> contacts = [SELECT Id, FirstName, LastName FROM Contact WHERE FirstName = 'Test' AND LastName = 'Contact'];
        System.assertEquals(1, contacts.size(), 'Contact should be created successfully');
        System.assertEquals('Test', contacts[0].FirstName, 'FirstName should be Test');
        System.assertEquals('Contact', contacts[0].LastName, 'LastName should be Contact');
    }
}