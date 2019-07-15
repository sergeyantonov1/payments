module Users
  class FindOrCreateByProvider
    include Interactor

    delegate :auth_params, to: :context
    delegate :info, to: :auth_params
    delegate :first_name, :last_name, :email, to: :info

    def call
      binding.pry
      find_or_create_user || context.fail!
    end

    private

    def find_or_create_user
      context.user =
        User.find_or_create_by(email: email) do |user|
          user.first_name = first_name
          user.second_name = last_name
          user.password = Devise.friendly_token
        end
    end
  end
end
