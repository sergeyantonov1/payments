module Users
  class AuthenticateViaProvider
    include Interactor::Organizer
    include TransactionalInteractor

    organize FindOrCreateByProvider, BindProvider
  end
end
