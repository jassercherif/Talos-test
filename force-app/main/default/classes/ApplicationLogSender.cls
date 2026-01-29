public class ApplicationLogSender {
    /**
     * Future method that performs outbound HTTP callouts.
     * Accepts a list of Ids (primitive collection allowed for @future).
     */
    @future(callout=true)
    public static void sendLogsFuture(List<Id> logIds) {
        if (logIds == null || logIds.isEmpty()) return;

        try {
            // Query required fields
            List<ApplicationLog__c> logs = [
                SELECT Id, Name, Function__c, LogCode__c, Message__c,
                       Message_court__c, ReferenceId__c, source__c, StackTrace__c, CreatedDate
                FROM ApplicationLog__c
                WHERE Id IN :logIds
            ];

            if (logs.isEmpty()) return;

            // We'll send payloads in batches to avoid too-large POST bodies.
            Integer batchSize = 100; // adjust if needed
            for (Integer i = 0; i < logs.size(); i += batchSize) {
                Integer end = Math.min(i + batchSize, logs.size());
                List<ApplicationLog__c> batch = logs.subList(i, end);

                // Build payload array
                List<Map<String, Object>> payload = new List<Map<String, Object>>();
                for (ApplicationLog__c l : batch) {
                    Map<String, Object> entry = new Map<String, Object>{
                        'id' => l.Id,
                        'name' => l.Name,
                        'function' => l.Function__c,
                        'logCode' => l.LogCode__c,
                        'message' => l.Message__c,
                        'message_short' => l.Message_court__c,
                        'referenceId' => l.ReferenceId__c,
                        'source' => l.source__c,
                        'stackTrace' => l.StackTrace__c,
                        // send created date as epoch millis (UTC)
                        'createdDate' => (l.CreatedDate == null) ? null : l.CreatedDate.getTime()
                    };
                    payload.add(entry);
                }

                String body = JSON.serialize(payload);

                HttpRequest req = new HttpRequest();
                // For production consider using Named Credential and "callout:My_Named_Credential/application-log"
                req.setEndpoint('https://foall.onrender.com/application-log');
                req.setMethod('POST');
                req.setHeader('Content-Type', 'application/json');
                req.setBody(body);
                req.setTimeout(120000);

                Http http = new Http();
                HttpResponse res = http.send(req);

                Integer status = res.getStatusCode();
                String respBody = res.getBody();

                // Simple response handling: log non-2xx responses for later manual inspection
                if (status < 200 || status >= 300) {
                    System.debug('ApplicationLogSender - non-2xx response. Status: ' + status + ' Body: ' + respBody);
                    // OPTIONAL: persist a failure record or take other retry action here
                } else {
                    System.debug('ApplicationLogSender - success. Status: ' + status);
                }
            }
        } catch (Exception e) {
            // Log exception details (consider persisting for retry)
            System.debug('ApplicationLogSender failed: ' + e.getMessage());
            System.debug(e.getStackTraceString());
            // OPTIONAL: persist failure details to a custom object for scheduled retry
        }
    }
}
