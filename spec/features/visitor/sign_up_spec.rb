require "rails_helper"

feature "Sign Up" do
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }
  let(:user_attributes) do
    attributes_for(:user).slice(
      :first_name, :second_name, :email, :password, :password_confirmation
    )
  end

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_form(:user, user_attributes)
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.full_name)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(registered_user.full_name)
  end

  scenario "via provider" do
    visit root_path

    click_on "Sign in with Google"
  end
end
