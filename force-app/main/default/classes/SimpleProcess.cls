public class SimpleProcess {
    public static ContactResult createContactWithError(String firstName, String lastName) {
        if (String.isBlank(firstName) && String.isBlank(lastName)) {
            return new ContactResult(false, 'Both firstName and lastName cannot be blank', null);
        }
        
        Contact newContact = new Contact();
        
        if (String.isNotBlank(firstName) && String.isNotBlank(lastName)) {
            newContact.FirstName = firstName;
            newContact.LastName = lastName;
            newContact.Name = firstName + ' ' + lastName;
        } else if (String.isNotBlank(lastName)) {
            newContact.LastName = lastName;
            newContact.Name = lastName;
        } else {
            newContact.FirstName = firstName;
            newContact.LastName = 'Unknown';
            newContact.Name = firstName + ' Unknown';
        }
        
        if (String.isBlank(newContact.Name)) {
            return new ContactResult(false, 'Name field could not be populated', null);
        }
        
        try {
            Database.SaveResult result = Database.insert(newContact, false);
            
            if (result.isSuccess()) {
                return new ContactResult(true, 'Contact created successfully', newContact.Id);
            } else {
                String errorMsg = '';
                for (Database.Error err : result.getErrors()) {
                    errorMsg += err.getMessage() + ' ';
                }
                return new ContactResult(false, errorMsg.trim(), null);
            }
        } catch (Exception e) {
            return new ContactResult(false, 'Unexpected error: ' + e.getMessage(), null);
        }
    }
    
    public class ContactResult {
        public Boolean success;
        public String message;
        public Id contactId;
        
        public ContactResult(Boolean success, String message, Id contactId) {
            this.success = success;
            this.message = message;
            this.contactId = contactId;
        }
    }
}