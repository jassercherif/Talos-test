public class SimpleProcess {
    public static void processAccounts(List<Account> accounts) {
        if (accounts == null || accounts.isEmpty()) {
            throw new SimpleProcessException('No accounts provided for processing.');
        }

        List<Account> accountsToUpdate = new List<Account>();
        for (Account acc : accounts) {
            if (String.isBlank(acc.Name)) {
                throw new SimpleProcessException('Account Name cannot be blank.');
            }
            accountsToUpdate.add(acc);
        }

        try {
            update accountsToUpdate;
        } catch (Exception e) {
            throw new SimpleProcessException('Failed to update accounts: ' + e.getMessage());
        }
    }

    public class SimpleProcessException extends Exception {}
}