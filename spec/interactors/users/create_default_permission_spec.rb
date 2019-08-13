require "rails_helper"

describe Users::CreateDefaultPermission do
  subject(:interactor) { described_class.new(initial_context) }

  let(:initial_context) { { user: user } }

  context "when user hasn't default permission" do
    let(:user) { create :user }
    let(:expected_permission_attributes) do
      {
        user_id: user.id,
        kind: "user",
        permitted_actions: %w[market_index market_show]
      }.stringify_keys
    end

    it "creates default permission" do
      expect { interactor.run }.to change(Permission, :count).by(1)

      expect(user.permissions.last.attributes).to include(expected_permission_attributes)
    end
  end

  context "when user has default permission" do
    let!(:user) { create :user, :with_default_permission }

    it "default permission isn't created" do
      expect { interactor.run }.not_to change(Permission, :count)
    end
  end
end
