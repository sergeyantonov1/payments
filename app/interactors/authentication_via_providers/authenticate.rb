module AuthenticationViaProviders
  class Authenticate
    include Interactor::Organizer
    include TransactionalInteractor

    organize AuthenticationViaProviders::PrepareData,
      AuthenticationViaProviders::FindOrCreateUserByProvider,
      AuthenticationViaProviders::BindProviderToUser
  end
end
