public class SimpleProcess {
  public static void createContactWithError() {
    Contact c = new Contact();
    c.Email = 'test@example.com';
    c.LastName = 'Doe';
    insert c;
  }
}