class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    if user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  private

  def user
    user ||= User.find_or_create_from_omniauth(request.env['omniauth.auth'])
  end
end
