global class SimpleProcess {
    global static Contact createContactWithError(String lastName, String email) {
        Contact c = new Contact();
        c.LastName = lastName;
        c.Email = email;
        try {
            insert c;
        } catch (DmlException e) {
            // Handle error
        }
        return c;
    }
}