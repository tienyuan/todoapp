require 'rails_helper'

describe "User workflow" do

  include EmailSpec::Helpers
  include EmailSpec::Matchers
  include Warden::Test::Helpers
  Warden.test_mode!

  describe "successful" do
    it "creates an user" do
      visit root_path
      click_link "Sign Up"
      fill_in 'Email', with: "createusertest@example.com"
      fill_in 'Username', with: "createusername"
      fill_in 'Password', with: "password"
      fill_in 'Password confirmation', with: "password"

      within 'form' do
        click_button 'Sign up'
      end
      
      click_email_confirmation_link

      fill_in 'Email', with: "createusertest@example.com"
      fill_in 'Password', with: "password"

      within 'form' do
        click_button 'Sign in'
      end

      expect(current_path).to eq tasks_path
    end
  end

  after do
    Warden.test_reset!
  end

  private

  def click_email_confirmation_link
    open_email("createusertest@example.com", with_subject: "Confirmation instructions")
    visit_in_email("Confirm my account")
  end
end