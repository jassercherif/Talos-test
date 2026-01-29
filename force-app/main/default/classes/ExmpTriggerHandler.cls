public class ExmpTriggerHandler {

    public static void handleAfterUpdate(Map<Id, Exmp__c> oldMap, Map<Id, Exmp__c> newMap) {
        List<Exmp__c> updatedRecords = new List<Exmp__c>();

        for (Id recId : newMap.keySet()) {
            Exmp__c oldRec = oldMap.get(recId);
            Exmp__c newRec = newMap.get(recId);

            // Optional: only add records that actually changed fields
            if (oldRec.Number__c != newRec.Number__c || oldRec.Chaine__c != newRec.Chaine__c) {
                updatedRecords.add(newRec);
            }
        }

        if (!updatedRecords.isEmpty()) {
            callExternalAPI(updatedRecords);
        }
    }

    private static void callExternalAPI(List<Exmp__c> records) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();

        // Using Remote Site Setting named "supabase1"
        req.setEndpoint('callout:supabase1/rest/v1/Exmp'); 
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndscGJqZHR3cGtvbWl3bGN4ZnZuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ4NDIxMTQsImV4cCI6MjA4MDQxODExNH0.uRWkj4Zr94pt4EgRVL12Bu7KlarkS1RIDXFMH--29jk');

        // Transform Salesforce SObjects to JSON array of objects containing only your table fields
        List<Map<String, Object>> payload = new List<Map<String, Object>>();
        for (Exmp__c rec : records) {
            Map<String, Object> mapRec = new Map<String, Object>();
            mapRec.put('number', rec.Number__c);
            mapRec.put('chaine', rec.Chaine__c);
            payload.add(mapRec);
        }
        req.setBody(JSON.serialize(payload));

        try {
            HttpResponse res = http.send(req);
            System.debug('API Status: ' + res.getStatusCode());
            System.debug('API Response: ' + res.getBody());
        } catch (Exception e) {
            System.debug('Error during callout: ' + e.getMessage());
        }
    }
}
