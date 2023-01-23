require "rails_helper"

describe "User signs in", type: :system do
  before do
    @user = User.create!(email: "ex@mail.com", password: "123456")
    visit root_path
    visit new_user_session_path
  end

  scenario "valid with correct credentials" do
    fill_in "email-field", with: @user.email
    fill_in "password-field", with: @user.password
    find('#submit-btn').click

    expect(page).to have_text "Signed in successfully."
  end

  scenario "valid with correct credentials" do
    fill_in "email-field", with: @user.email
    fill_in "password-field", with: @user.password
    find('#submit-btn').click

    expect(page).to have_button "Log out"
  end

  scenario "valid with correct credentials" do
    fill_in "email-field", with: @user.email
    fill_in "password-field", with: @user.password
    find('#submit-btn').click

    expect(page).to have_current_path root_path(locale: :en)
  end

  scenario "invalid with unregistered account" do
    fill_in "email-field", with: Faker::Internet.email
    fill_in "password-field", with: "FakePassword123"
    find('#submit-btn').click

    expect(page).to have_no_text "Signed in successfully."
  end

  scenario "invalid with unregistered account" do
    fill_in "email-field", with: Faker::Internet.email
    fill_in "password-field", with: "FakePassword123"
    find('#submit-btn').click

    expect(page).to have_text "Invalid Email or password."
  end

  scenario "invalid with unregistered account" do
    fill_in "email-field", with: Faker::Internet.email
    fill_in "password-field", with: "FakePassword123"
    find('#submit-btn').click

    expect(page).to have_no_link "Sign Out"
  end

  scenario "invalid with invalid password" do
    fill_in "email-field", with: @user.email
    fill_in "password-field", with: "FakePassword123"
    find('#submit-btn').click

    expect(page).to have_no_text "Signed in successfully."
    expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Sign Out"
  end
end