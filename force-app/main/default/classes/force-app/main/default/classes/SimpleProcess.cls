public class SimpleProcess {
    public static void createContactWithError(Contact contact) {
        // Validate required field before insert
        if (contact.Name == null || contact.Name.trim().isEmpty()) {
            throw new IllegalArgumentException('Contact Name is required and cannot be empty');
        }
        
        // Proceed with insert only if validation passes
        insert contact;
    }
}