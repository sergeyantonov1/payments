module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end
    end
  end

  private

  def authenticate_via_provider
    if authentication_via_provider.success?
      sign_in_and_redirect authentication_via_provider.user
    else
      redirect_to new_user_session_path
    end
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

  def authentication_via_provider
    @authentication_via_provider ||=
      AuthenticationViaProviders::Authenticate.call(
        auth_params: provider_authentication_data
      )
  end

  def provider_authentication_data
    request.env["omniauth.auth"]
  end
end
