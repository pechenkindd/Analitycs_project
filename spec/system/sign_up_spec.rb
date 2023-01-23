require "rails_helper"

describe "User signs up", type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { "Mn123nd#4" }
  let(:invalid_password) { "123" }
  let(:short_password) { "Mn452"}

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

  scenario "when email is already exists" do
    user = create :user

    fill_in "email-field", with: user.email
    fill_in "password-field", with: password
    fill_in "password-confirm-field", with: password
    
    find('#submit-btn').click

    expect(page).to have_text "Email has already been taken"
  end

  scenario "with password length < 6" do
    fill_in "email-field", with: email
    fill_in "password-field", with: invalid_password
    fill_in "password-confirm-field", with: invalid_password

    find('#submit-btn').click

    expect(page).to have_no_text("Welcome! You have signed up successfully.")
  end

  scenario "with no matching passwords" do
		fill_in "email-field", with: email
		fill_in "password-field", with: password
		fill_in "password-confirm-field", with: password + Faker::Number.number(digits: 2).to_s

		find('#submit-btn').click
		expect(page).to have_content("Password confirmation doesn't match Password")
	end

  scenario "with short password" do
		fill_in "email-field", with: email
		fill_in "password-field", with: short_password
		fill_in "password-confirm-field", with: short_password

		find('#submit-btn').click
		expect(page).to have_text('Password is too short (minimum is 6 characters)')
	end

  scenario "invalid with invalid email" do
    fill_in "email-field", with: ""
    fill_in "password-field", with: password
    fill_in "password-confirm-field", with: password
    find('#submit-btn').click

    expect(page).to have_text("Email can't be blank")
  end

  scenario "sign up password numbers" do
		fill_in "email-field", with: email
		fill_in "password-field", with: password + " "
		fill_in "password-confirm-field", with: password + " "

		find('#submit-btn').click
		expect(page).to have_text('Password : Пробел не допустим в начале или конце строки')
	end
end
