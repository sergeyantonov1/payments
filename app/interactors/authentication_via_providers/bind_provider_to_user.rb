module AuthenticationViaProviders
  class BindProviderToUser
    include Interactor

    delegate :provider_params, :user, to: :context


    def call
      return if provider_existed?

      context.fail! unless bind_provider
    end

    private

    def bind_provider
      user.authentication_methods.create(
        provider: provider_params[:provider],
        uid: provider_params[:uid],
        token: provider_params[:token],
        refresh_token: provider_params[:refresh_token],
        expires: provider_params[:expires],
        expires_at: provider_params[:expires_at],
       )
    end

    def provider_existed?
      user.authentication_methods.exists?(provider: provider_params[:provider])
    end
  end
end
