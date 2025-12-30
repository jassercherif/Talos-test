@IsTest
public class FaultyOrderProcessTest {

    @IsTest
    static void testCreateContactWithError() {

        // Execute faulty process
        Test.startTest();
        FaultyOrderProcess.createContactWithError();
        Test.stopTest();

        // Verify that an Application Log was created
        List<ApplicationLog__c> logs = [
            SELECT Id, Source__c, Function__c, Message__c
            FROM ApplicationLog__c
        ];

        System.assertEquals(
            1,
            logs.size(),
            'One application log should be created'
        );

        System.assertEquals(
            'FaultyOrderProcess',
            logs[0].Source__c,
            'Source__c should match the class name'
        );

        System.assertEquals(
            'createContactWithError',
            logs[0].Function__c,
            'Function__c should match the method name'
        );

        System.assert(
            logs[0].Message__c.contains('Error'),
            'Log message should contain the word "Error"'
        );
    }
}
