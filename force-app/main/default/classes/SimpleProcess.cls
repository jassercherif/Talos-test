global class SimpleProcess {
    global static Contact createContactWithError() {
        Contact c = new Contact();
        c.FirstName = 'Default';
        c.LastName = 'User';
        c.Email = 'test@example.com';
        c.Phone = '123-456-7890';
        insert c;
        return c;
    }
}