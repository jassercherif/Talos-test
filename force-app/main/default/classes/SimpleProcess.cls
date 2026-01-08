public class SimpleProcess {
    public static void createContactWithError() {
        Contact con = new Contact();
        con.Email = 'test@example.com';
        con.FirstName = 'Test';
        con.LastName = 'Contact';
        con.Name = con.FirstName + ' ' + con.LastName; // Derive Name from first/last
        try {
            insert con;
        } catch (Exception ex) {
            System.debug('Error when creating the contact: ' + ex.getMessage());
        }
    }
}