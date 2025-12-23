@isTest
public class UpdateLeadErrorTest {
    @isTest
    static void testUpdateLeadWithError() {
        Test.startTest();
        UpdateLeadError.updateLeadWithError();
        Test.stopTest();

        List<ApplicationLog__c> logs = [
            SELECT Id, Source__c, Function__c, Message__c
            FROM ApplicationLog__c
            WHERE Source__c = 'UpdateLeadError'
        ];

        System.assertEquals(1, logs.size(), 'Un log doit être créé');
        System.assertEquals('updateLeadWithError', logs[0].Function__c);
        System.assert(
            logs[0].Message__c.contains('Erreur'),
            'Le message du log devrait contenir le mot "Erreur".'
        );
    }
}
