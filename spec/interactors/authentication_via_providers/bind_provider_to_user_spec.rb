require "rails_helper"

describe AuthenticationViaProviders::BindProviderToUser do
  subject(:interactor) do
    AuthenticationViaProviders::BindProviderToUser.new(
      provider_params: provider_params,
      user: user
    )
  end

  let(:user) { create :user, email: "example@example.com" }
  let(:provider_params) do
    {
      provider: "google_oauth2",
      uid: "uid123",
      token: "token123",
      refresh_token: "refresh_token123",
      expires: true,
      expires_at: 1564133288,
    }
  end
  let(:auth_method) { AuthenticationMethod.last }

  it "binds provider to user" do
    expect { interactor.run }.to change(AuthenticationMethod, :count).by(1)

    expect(auth_method.provider).to eq "google_oauth2"
    expect(auth_method.provider).to eq "uid123"
    expect(auth_method.provider).to eq "token123"
    expect(auth_method.provider).to eq "refresh_token123"
    expect(auth_method.provider).to be_truthy
    expect(auth_method.provider).to eq "google_oauth2"

  end

  context "when provider already binding" do
    let!(:provider) { create :authentication_method, provider: "google_oauth2", user: user }

    it "returns" do
      expect { interactor.run }.not_to change(AuthenticationMethod, :count)
    end
  end
end
