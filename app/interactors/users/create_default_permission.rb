module Users
  class CreateDefaultPermission
    include Interactor

    delegate :user, to: :context

    def call
      return if default_permission_exists?

      context.fail! unless create_default_user_permission
    end

    private

    def create_default_user_permission
      user.permissions.create
    end

    def default_permission_exists?
      user.permissions.exists?(kind: :user)
    end
  end
end
