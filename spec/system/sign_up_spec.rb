require "rails_helper"

describe "User signs up", type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 6) }
  let(:invalid_password) { "123" }

  before do
    visit new_user_registration_path
  end

  scenario "with valid data" do
    fill_in "email-field", with: email
    fill_in "password-field", with: password
    fill_in "password-confirm-field", with: password

    find('#submit-btn').click

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "invalid when email already exists" do
    user = create :user

    fill_in "email-field", with: user.email
    fill_in "password-field", with: password
    fill_in "password-confirm-field", with: password
    
    find('#submit-btn').click

    expect(page).to have_no_text "Welcome back"
    expect(page).to have_text "Email has already been taken"
  end

  scenario "invalid with password length < 6" do
    fill_in "email-field", with: email
    fill_in "password-field", with: invalid_password
    fill_in "password-confirm-field", with: invalid_password

    expect(page).to have_no_text("Welcome! You have signed up successfully.")
  end
end
