public class SimpleProcess {
    // ... existing code ...
    
    public static void createContactWithError() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        
        // FIX-001: Add Name field to Contact creation
        Contact newContact = new Contact(
            LastName = 'Smith', 
            AccountId = acc.Id, 
            Name = 'John Smith'
        );
        
        insert newContact;
    }
    
    // ... rest of the class ...
}