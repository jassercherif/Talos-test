global class UpdateLeadError {
    global static void updateLeadWithError(Id leadId) {
        if (leadId == null) {
            throw new AuraHandledException('Missing argument: leadId', null, true, true);
        }
        // existing logic...
    }

    // Test class
    global testmethod static void testUpdateLeadWithError() {
        Test.startTest();
        try {
            UpdateLeadError.updateLeadWithError(null);
            System.assert(false, 'Expected exception');
        } catch (AuraHandledException e) {
            System.assertEquals('Missing argument: leadId', e.getMessage());
            System.assertEquals(true, e.isAccessible());
            System.assertEquals(true, e.isSystem());
        }
        Test.stopTest();
    }
}