@isTest
public class SimpleProcessTest {
 
    @isTest
    static void testCreateContactWithError() {
 
        Test.startTest();
        SimpleProcess.createContactWithError();
        Test.stopTest();
 
        // Vérification du log
        List<ApplicationLog__c> logs = [
            SELECT Id, Source__c, Function__c, Message__c
            FROM ApplicationLog__c
        ];
 
        System.assertEquals(1, logs.size(), 'Un log doit être créé');
        System.assertEquals('SimpleProcess', logs[0].Source__c);
        System.assertEquals('createContactWithError', logs[0].Function__c);
        // System.assertContains(logs[0].Message__c, 'Erreur');
        System.assert(
    logs[0].Message__c.contains('Erreur'),
    'Le message du log devrait contenir le mot "Erreur".'
);
    }
}