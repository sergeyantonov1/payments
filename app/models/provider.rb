class Provider < ApplicationRecord
  belongs_to :user

  validates :provider, :uid, presence: true
  validates :proivder, uniqueness: { scope: :uid }
end
