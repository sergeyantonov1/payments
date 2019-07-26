FactoryGirl.define do
  factory :authentication_method do
    provider { "google_oauth2" }
    uid { "uid123" }
    token { "token123" }
    secret { "secret123" }
    expires { true }
    expires_at { 1564133288 }
    user
  end
end
