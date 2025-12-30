@IsTest
public class FaultyOpportunityProcessTest {

    @IsTest
    static void testCreateOpportunityWithError() {

        Test.startTest();
        FaultyOpportunityProcess.createOpportunityWithError();
        Test.stopTest();

        List<ApplicationLog__c> logs = [
            SELECT Id, Source__c, Function__c, Message__c
            FROM ApplicationLog__c
        ];

        System.assertEquals(
            1,
            logs.size(),
            'One ApplicationLog__c record should be created'
        );

        System.assertEquals(
            'FaultyOpportunityProcess',
            logs[0].Source__c
        );

        System.assertEquals(
            'createOpportunityWithError',
            logs[0].Function__c
        );

        System.assert(
            logs[0].Message__c.contains('Opportunity'),
            'Log message should mention Opportunity'
        );
    }
}
