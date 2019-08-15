require "rails_helper"

describe AuthenticationViaProviders::BindProviderToUser do
  subject(:interactor) { described_class.new(provider_params: provider_params, user: user) }

  let(:user) { create :user, email: "example@example.com" }
  let(:auth_method) { AuthenticationMethod.last }
  let(:provider_params) do
    {
      provider: "google_oauth2",
      uid: "uid123",
      token: "token123",
      expires: true,
      expires_at: Time.current + 10.days
    }
  end

  it "binds provider to user" do
    expect { interactor.run }.to change(AuthenticationMethod, :count).by(1)

    expect(auth_method.provider).to eq "google_oauth2"
    expect(auth_method.uid).to eq "uid123"
    expect(auth_method.token).to eq "token123"
    expect(auth_method.expires).to be_truthy
  end

  context "when provider already binding" do
    before do
      create :authentication_method, provider: "google_oauth2", user: user
    end

    it "returns" do
      expect { interactor.run }.not_to change(AuthenticationMethod, :count)
    end
  end
end
