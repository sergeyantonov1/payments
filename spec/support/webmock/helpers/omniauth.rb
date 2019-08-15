module WebmockHelpers
  module Omniauth
    GOOGLE_OMNIAUTH_PARAMS = {
      provider: "google_oauth2",
      uid: "uid123",
      info: {
        name: "Jack Howard",
        email: "jack.howard@example.com",
        unverified_email: "jack.howard@example.com",
        email_verified: "jack.howard@example.com",
        first_name: "Jack",
        last_name: "Howard"
      },
      credentials: {
        token: "token123",
        refresh_token: "refreshtoken123",
        expires_at: Time.current + 10.days,
        expires: true
      }
    }.freeze

    def mock_successed_authentication_via_google
      OmniAuth.config.add_mock(:google_oauth2, GOOGLE_OMNIAUTH_PARAMS)
    end

    def mock_failed_authentication_via_google
      OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    end
  end
end
