public class UpdateLeadError {
    public static void forceError() {
        Lead l = new Lead(LastName='Test', Company='Test');
        try {
            // Force an error: attempting to update a Lead without Id
            update l;
        } catch (DMLException e) {
            System.debug('Erreur: ' + e.getMessage());
        }
    }
}