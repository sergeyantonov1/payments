require "rails_helper"

describe AuthenticationMethod do
  it { is_expected.to validate_presence_of :provider }
  it { is_expected.to validate_presence_of :uid }
end
