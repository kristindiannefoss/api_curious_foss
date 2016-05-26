require 'test_helper'

class UserLogsInWithGoogleTestTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup

    Capybara.app = ApiCuriousFoss::Application
    stub_omniauth
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login with Google+"
    assert_equal "/auth/google_oauth2/callback", current_path
# save_and_open_page
  end
end

def stub_omniauth
  # first, set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # then, provide a set of fake oauth data that
  # omniauth will use when a user tries to authenticate:
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    token: "ya29.CjHsAg4d8SJ6mrvEaHzlK7ZGhk0jX71Eu6XzjN0GUol4kKU_Q7Bl6Q6Oa-u8e1A3ZZja",
    extra: {
      raw_info: {
        user_id: "1234",
        name: "Horace",
        screen_name: "worace"
      }
    },
    credentials: {
      token: "pizza",
      secret: "secretpizza"
    }
  })
end
