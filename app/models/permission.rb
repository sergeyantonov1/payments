class Permission < ApplicationRecord
  extend Enumerize

  USER_PERMISSION_TYPES = %i[user market_manager market_owner admin].freeze
  DEFAULT_PERMITTED_ACTION = %i[market_index market_show].freeze
  PERMITTED_ACTION_SCOPES = %i[market_index market_show].freeze

  serialize :permitted_actions

  enumerize :kind, in: USER_PERMISSION_TYPES, default: :user, scope: true
  enumerize :permitted_actions, in: PERMITTED_ACTION_SCOPES, multiple: true,
    default: DEFAULT_PERMITTED_ACTION, predicated: true

  belongs_to :user

  # has_many :permitted_locations

  validates :user, :kind, :permitted_actions, presence: true
  validates :kind, uniqueness: { scope: :user }
end
