module Users
  class BindProvider
    include Interactor

    delegate :auth_params, :user, to: :context
    delegate :info, :provider, :uid, to: :auth_params

    def call
      binding.pry
      return if provider_existed?

      bind_provider || context.fail!
    end

    private

    def bind_provider
      AuthenticationMethod.create(
        provider: provider,
        uid: uid,
        user: user
      )
    end

    def provider_existed?
      user.authentication_methods.exists?(provider: provider)
    end
  end
end
