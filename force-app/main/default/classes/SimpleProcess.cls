global class SimpleProcess {
    global static String process(String input) {
        String lastName = input != null ? input.substring(0, Math.min(input.length(), 80)) : null;
        // existing logic...
        return "Processed: " + lastName;
    }
}