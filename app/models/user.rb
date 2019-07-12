class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :second_name, presence: true

  has_many :providers, dependent: :destroy

  def self.find_or_create_from_omniauth(access_token)
    User.find_or_create_by(email: access_token.info.email) do |user|
      user.first_name = access_token.info.first_name
      user.second_name = access_token.info.last_name
      user.
    end






    binding.pry


    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
end
