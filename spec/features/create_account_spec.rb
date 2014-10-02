require 'rails_helper'

describe "Creating an user workflow" do

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
      
      login_as(@user, :scope => :user)
      expect(current_path).to eq(tasks_path)
    end
  end

  after do
    Warden.test_reset!
  end

end