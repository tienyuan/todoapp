require 'rails_helper'

feature "Visitor signs up" do

  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include Warden::Test::Helpers
  Warden.test_mode!

  before(:each) do
    reset_mailer
  end

  scenario "with valid email and password" do
    sign_up_with('new_email@example.com', 'new_username', 'password')

    click_email_confirmation_link('new_email@example.com')
    fill_in 'Email', with: "new_email@example.com"
    fill_in 'Password', with: "password"
    within 'form' do
      click_button 'Sign in'
    end

    expect(current_path).to eq tasks_path
  end

  scenario "with invalid email" do
    sign_up_with('new_email@example', 'new_username', 'password')

    expect(current_path).to eq user_registration_path
  end

  scenario "with blank username" do
    sign_up_with('new_email@example', '', 'password')

    expect(current_path).to eq user_registration_path
  end

  scenario "with blank password" do
    sign_up_with('new_email@example.com', 'new_username', '')

    expect(current_path).to eq user_registration_path
  end

  after do
    Warden.test_reset!
  end

  private

  def click_email_confirmation_link(email)
    open_email(email, with_subject: "Confirmation instructions")
    visit_in_email("Confirm my account")
  end

  def sign_up_with(email, username, password)
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', with: email
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password

    within 'form' do
      click_button 'Sign up'
    end
  end
end