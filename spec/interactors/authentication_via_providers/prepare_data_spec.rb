require "rails_helper"

describe AuthenticationViaProviders::PrepareData do
  subject(:interactor) { described_class.new(auth_params: auth_params) }

  context "when provider is google" do
    let(:auth_params) { mock_successed_authentication_via_google }
    let(:strategy) { AuthenticationViaProviders::Preparers::GoogleOauth2 }
    let(:google_preparer) do
      instance_double(
        "AuthenticationViaProviders::Preparers::GoogleOauth2",
        user_params: {},
        provider_params: {}
      )
    end

    before do
      allow(strategy).to receive(:call).and_return(google_preparer)
    end

    it "calls google preparer" do
      expect(strategy).to receive(:call).with(auth_params: auth_params)

      interactor.run
    end
  end

  context "when invalid credentials" do
    let(:auth_params) { mock_failed_authentication_via_google }

    it "returns error" do
      interactor.run

      expect(interactor.context).to be_failure
      expect(interactor.context.error).to eq "Sorry, provider unsupported!"
    end
  end
end
