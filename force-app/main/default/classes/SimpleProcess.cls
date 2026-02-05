public class SimpleProcess {
    public static void processRecords(List<SObject> records) {
        for (SObject record : records) {
            // Apply business logic here
            if (record.get('Status') == 'Active') {
                record.put('Processed__c', true);
            }
        }
    }
}