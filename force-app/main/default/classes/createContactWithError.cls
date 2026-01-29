global class createContactWithError {
    global static void createContactWithErrors() {
        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'Doe'; // Populated to fix REQUIRED_FIELD_MISSING
        insert c;
    }
}