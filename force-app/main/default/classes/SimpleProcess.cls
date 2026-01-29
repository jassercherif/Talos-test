global class SimpleProcess {
    global static List<Contact> getContacts() {
        List<Contact> contacts = new List<Contact>();
        Contact c = new Contact();
        c.FirstName = 'Test';
        c.LastName = 'User';
        contacts.add(c);
        return contacts;
    }
}