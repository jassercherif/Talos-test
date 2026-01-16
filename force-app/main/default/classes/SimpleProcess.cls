Account acc = new Account(
    Name = 'Test Account',  // Added required Name field
    AccountNumber = '123'
);
insert acc;

// Contact volontairement erroné (LastName trop long)
Contact c = new Contact(
    LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
    AccountId = acc.Id
);