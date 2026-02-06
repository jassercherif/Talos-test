public class SimpleProcess {
    public static void processContact(Contact c) {
        // Set FirstName and LastName fields as required by the fix
        if (c.FirstName == null) {
            c.FirstName = 'DefaultFirstName';
        }
        if (c.LastName == null) {
            c.LastName = 'DefaultLastName';
        }
        
        // Existing logic continues here
        // ... (other existing code)
    }
}