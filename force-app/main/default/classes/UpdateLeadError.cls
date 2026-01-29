global class UpdateLeadError {
    global static void updateLead(Id leadId) {
        Lead lead = [SELECT Id, Name FROM Lead WHERE Id = :leadId LIMIT 1];
        
        // Null check for Lead object
        if (lead == null) {
            throw new AuraHandledException('Lead not found');
        }
        
        // Null check for Lead.Id
        if (lead.Id == null) {
            throw new AuraHandledException('Lead ID is null');
        }
        
        // Proceed with DML operation
        update lead;
    }
}