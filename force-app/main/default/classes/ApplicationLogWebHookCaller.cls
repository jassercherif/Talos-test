public without sharing class ApplicationLogWebHookCaller {
    /**
     * Future method that accepts a List<Id> (allowed for @future) and makes callouts.
     * It queries the ApplicationLog__c records, constructs a JSON array and POSTs to the endpoint.
     */
   @future(callout=true)
public static void callFlaskWebhook(List<Id> logIds) {
    if (logIds == null || logIds.isEmpty()) return;
    List<ApplicationLog__c> logs = [
        SELECT Id, Name, Function__c, LogCode__c, Message__c,
               Message_court__c, ReferenceId__c, source__c, StackTrace__c, CreatedDate
        FROM ApplicationLog__c
        WHERE Id IN :logIds
    ];
    Http http = new Http();
    for (ApplicationLog__c l : logs) {
        Map<String,Object> entry = new Map<String,Object>{
            'id' => l.Id,
            'name' => l.Name,
            'function' => l.Function__c,
            'logCode' => l.LogCode__c,
            'message' => l.Message__c,
            'message_short' => l.Message_court__c,
            'referenceId' => l.ReferenceId__c,
            'source' => l.source__c,
            'stackTrace' => l.StackTrace__c,
            'createdDate' => (l.CreatedDate == null) ? null : l.CreatedDate.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'')
        };
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://foall.onrender.com/application-log');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setBody(JSON.serialize(entry));
        req.setTimeout(120000);
        try {
            HttpResponse res = http.send(req);
            System.debug('Status: ' + res.getStatusCode());
        } catch (Exception e) {
            System.debug('Callout failed: ' + e.getMessage());
        }
    }
}

}
