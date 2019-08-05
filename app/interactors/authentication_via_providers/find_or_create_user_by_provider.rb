module AuthenticationViaProviders
  class FindOrCreateUserByProvider
    include Interactor

    delegate :user_params, to: :context

    def call
      context.fail! unless find_or_create_user
    end

    private

    def find_or_create_user
      context.user = User.find_or_create_by(email: user_params[:email]) do |user|
        user.first_name = user_params[:first_name]
        user.second_name = user_params[:second_name]
        user.password = Devise.friendly_token

        user.confirm
      end
    end
  end
end
