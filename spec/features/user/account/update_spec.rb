require "rails_helper"

feature "Update Account" do
  include_context "when current user signed in"

  background do
    visit edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_form(:user, :edit, first_name: "John", second_name: "Smith")
    click_on "Update"

    expect(page).to have_content("John Smith")
  end

  scenario "User enters not matched passwords" do
    fill_form(:user, :edit, password: "qwerty", password_confirmation: "123123")
    click_on "Update"

    expect(page).to have_content("doesn't match Password")
  end
end
