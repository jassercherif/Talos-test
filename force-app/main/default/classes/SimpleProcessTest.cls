public class SimpleProcessTest {
    static testMethod void testCreateContactWithError() {
        Contact c = SimpleProcess.createContactWithError('Test Name');
        System.assertEquals('Test', c.FirstName, 'FirstName should be set');
        System.assertEquals('User', c.LastName, 'LastName should be set');
    }
}