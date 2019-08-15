require "rails_helper"

describe AuthenticationViaProviders::FindOrCreateUserByProvider do
  subject(:interactor) { described_class.new(user_params: user_params) }

  let(:user_params) do
    {
      first_name: "John",
      second_name: "Smith",
      email: "example@example.com"
    }
  end

  context "when user already exists" do
    before do
      create :user, email: "example@example.com"
    end

    it "returns existed user" do
      expect { interactor.run }.not_to change(User, :count)
    end
  end

  context "when user not created" do
    let(:created_user) { User.last }

    it "creates new user" do
      expect { interactor.run }.to change(User, :count).by(1)

      expect(created_user.email).to eq "example@example.com"
      expect(created_user.first_name).to eq "John"
      expect(created_user.second_name).to eq "Smith"
      expect(created_user).to be_confirmed
    end
  end
end
