/**
 * UpdateLeadError
 * 
 * This class is intentionally designed to demonstrate problematic error handling patterns.
 * It is NOT intended for production use and serves as an educational example.
 * 
 * @author Salesforce Developer
 * @version 1.0
 * @see https://developer.salesforce.com/docs
 */
public class UpdateLeadError {
    
    /**
     * Updates a Lead record with the provided data.
     * 
     * This method intentionally contains a logical error to demonstrate problematic patterns.
     * The error involves incorrect field assignment, which would cause unexpected behavior in production.
     * 
     * @param leadId The ID of the Lead record to update.
     * @param newStatus The new status value to assign to the Lead.
     * @return Boolean indicating whether the update was successful.
     * @throws Exception If the Lead record cannot be found or updated.
     */
    public static Boolean updateLeadStatus(String leadId, String newStatus) {
        try {
            // Query the Lead record
            Lead leadToUpdate = [SELECT Id, Status FROM Lead WHERE Id = :leadId LIMIT 1];
            
            // INTENTIONAL ERROR: Incorrect field assignment
            // This line assigns the newStatus to the Company field instead of the Status field.
            // This is a demonstration of a problematic pattern and should NOT be replicated in production.
            leadToUpdate.Company = newStatus; // ERROR: Should be leadToUpdate.Status = newStatus;
            
            // Update the Lead record
            update leadToUpdate;
            
            return true;
        } catch (Exception e) {
            // Log the error
            System.debug('Error updating Lead: ' + e.getMessage());
            throw e;
        }
    }
}