public class SimpleProcess {
    public static void createContactWithError(String lastName, String email, String phone) {
        Contact c = new Contact();
        c.LastName = lastName;
        c.Email = email;
        c.Phone = phone;
        // Ensure Name is explicitly set if required
        c.Name = lastName + ' ' + (String.isNotBlank(firstName) ? firstName : '');
        insert c;
    }
}