class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable,
    :omniauthable, omniauth_providers: [:google_oauth2]

  validates :first_name, :second_name, presence: true

  has_many :authentication_methods, dependent: :destroy
  has_many :permissions, dependent: :destroy

  def full_name
    "#{first_name} #{second_name}"
  end
end
