require "rails_helper"

describe User do
  it { is_expected.to have_many(:authentication_methods).dependent(:destroy) }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :second_name }

  describe "#full_name" do
    subject { create :user, first_name: "John", second_name: "Smith" }

    it { expect(subject.full_name).to eq "John Smith"}
  end
end
