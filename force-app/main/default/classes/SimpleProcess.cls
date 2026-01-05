// Contact volontairement erroné (LastName trop long)
Contact c = new Contact(
    LastName = 'NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur',
    AccountId = acc.Id,
    Name = 'Test NomBeaucoupBeaucoupBeaucoupTropLongPourForcerUneErreur'  // Add required Name field
);

insert c; // va déclencher une erreur