public class SimpleProcess {
    public static void createContactWithError() {
        Contact c = new Contact();
        c.Name = 'Test Contact';
        c.Phone = '555-0199';
        c.MailingStreet = '123 Main St';
        c.MailingCity = 'Anytown';
        c.MailingState = 'CA';
        c.MailingPostalCode = '90210';
        c.MailingCountry = 'USA';
        insert c;
    }
}