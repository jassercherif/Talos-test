global class SimpleProcess {
    global static Contact createContactWithError(String lastName, String email) {
        Contact c = new Contact();
        c.LastName = lastName;
        c.Email = email;
        c.Name = lastName + ' ' + email; // Ensure Name field is populated
        insert c;
        return c;
    }
}