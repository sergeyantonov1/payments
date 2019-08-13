FactoryGirl.define do
  factory :permission do
    kind { :user }
    permitted_actions { Permission::DEFAULT_PERMITTED_ACTION }
    user
  end
end
