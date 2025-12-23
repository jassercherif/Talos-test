public with sharing class ApplicationLogPython {
    public ApplicationLogPython() {
    }
 
    public static ApplicationLog__c buildApplicationLog(
        String source,
        String function,
        List<String> messages,
        String stackTrace,
        String refId,
        String messageCourt
    ) {
        source = String.isBlank(source) ? source : source.left(ApplicationLog__c.Source__c.getDescribe().getLength());
        function = String.isBlank(function) ? function : function.left(ApplicationLog__c.Function__c.getDescribe().getLength());
        stackTrace = String.isBlank(stackTrace) ? stackTrace : stackTrace.left(ApplicationLog__c.StackTrace__c.getDescribe().getLength());
        refId = String.isBlank(refId) ? refId : refId.left(ApplicationLog__c.ReferenceId__c.getDescribe().getLength());
        messageCourt = String.isBlank(messageCourt)
            ? messageCourt
            : messageCourt.left(ApplicationLog__c.Message_court__c.getDescribe().getLength());
 
        String message = messages != null ? String.join(messages, '\n') : null;
        message = String.isBlank(message) ? message : message.left(ApplicationLog__c.Message__c.getDescribe().getLength());
        // 2024 S12: 49834 [Flex-Tech] Alimenter le log code dans application log
        // Recuperer LogCode depuis l'exception
        String logCode = !String.isBlank(message) && message.contains('"faultcode":')
            ? message.substringBetween('"faultcode": ', ',')
            : null;
 
        return new ApplicationLog__c(
            Source__c = source,
            Function__c = function,
            Message__c = message,
            Message_court__c = messageCourt,
            ReferenceId__c = refId,
            StackTrace__c = stackTrace,
            LogCode__c = logCode
        );
    }
 
    @future
    public static void insertFutureLog(
        String source,
        String function,
        List<String> messages,
        String stackTrace,
        String refId,
        String messageCourt
    ) {
        insert buildApplicationLog(source, function, messages, stackTrace, refId, messageCourt);
    }
}