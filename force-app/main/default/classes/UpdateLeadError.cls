public class UpdateLeadError {
    public static void updateLeads(List<Lead> leads) {
        List<Lead> leadsToUpdate = new List<Lead>();
        for (Lead l : leads) {
            if (l.Id != null) {
                l.Description = 'Updated by batch';
                leadsToUpdate.add(l);
            }
        }
        update leadsToUpdate;
    }
}