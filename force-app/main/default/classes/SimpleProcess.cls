global class SimpleProcess {
    global static void processContact(Contact contact) {
        // Truncate last name to 80 characters to prevent REQUIRED_FIELD_MISSING error
        String truncatedLastName = contact.LastName != null ? contact.LastName.substring(0, Math.min(contact.LastName.length(), 80)) : null;
        contact.LastName = truncatedLastName;
        // ... existing logic ...
    }
}