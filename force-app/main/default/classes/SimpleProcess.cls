global class SimpleProcess {
    global static Contact createContactWithError() {
        Contact contact = new Contact();
        contact.FirstName = 'Test';
        contact.LastName = 'User'; // Populated to resolve REQUIRED_FIELD_MISSING
        return contact;
    }
}