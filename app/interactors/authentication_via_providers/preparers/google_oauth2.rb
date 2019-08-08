module AuthenticationViaProviders
  module Preparers
    class GoogleOauth2
      include Interactor

      delegate :auth_params, to: :context
      delegate :provider, :uid, :info, :credentials, to: :auth_params
      delegate :email, :first_name, :last_name, :image, to: :info
      delegate :token, :refresh_token, :expires_at, :expires, to: :credentials

      def call
        context.user_params = user_params
        context.provider_params = provider_params
      end

      def user_params
        {
          first_name: first_name,
          second_name: last_name,
          email: email
        }
      end

      def provider_params
        {
          provider: provider,
          uid: uid,
          token: token,
          expires: expires,
          expires_at: expires_at
        }
      end
    end
  end
end
