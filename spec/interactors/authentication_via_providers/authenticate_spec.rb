require "rails_helper"

describe AuthenticationViaProviders::Authenticate do
  let(:expected_interactors) do
    [
      AuthenticationViaProviders::PrepareData,
      AuthenticationViaProviders::FindOrCreateUserByProvider,
      AuthenticationViaProviders::BindProviderToUser
    ]
  end

  it "organizes other interactors" do
    expect(described_class.organized).to eq(expected_interactors)
  end
end
