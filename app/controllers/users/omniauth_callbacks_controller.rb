class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    sign_in authenticatable_user
  end

  private

  def authenticatable_user
    @authenticatable_user ||=
      Users::AuthenticateViaProvider.call(auth_params: auth_params).user
  end

  def auth_params
    request.env["omniauth.auth"]
  end
end
