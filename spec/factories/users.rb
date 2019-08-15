FactoryGirl.define do
  factory :user do
    email
    first_name { Faker::Name.first_name }
    second_name { Faker::Name.last_name }
    password { "123456" }
    password_confirmation { password }
    confirmed_at { 1.hour.ago }
  end

  trait :not_confirmed do
    confirmed_at {}

    after :create do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end

  trait :with_default_permission do
    after :create do |user|
      user.permissions.create
    end
  end
end
