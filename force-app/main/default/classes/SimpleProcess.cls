global class SimpleProcess {
    global static void process() {
        Contact contact = new Contact();
        contact.FirstName = 'John';
        contact.LastName = 'Doe';
        insert contact;
    }
}