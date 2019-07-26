class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    authenticate_via_provider
  end

  def facebook
    authenticate_via_provider
  end
end
