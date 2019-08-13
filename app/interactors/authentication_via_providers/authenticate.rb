module AuthenticationViaProviders
  class Authenticate
    include Interactor::Organizer
    include TransactionalInteractor

    organize AuthenticationViaProviders::PrepareData,
      AuthenticationViaProviders::FindOrCreateUserByProvider,
      Users::CreateDefaultPermission,
      AuthenticationViaProviders::BindProviderToUser
  end
end
