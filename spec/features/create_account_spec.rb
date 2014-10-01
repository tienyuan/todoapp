require 'rails_helper'

describe "Creating an user workflow" do

  describe "successful" do
    it "creates an user" do
      visit root_path
      click_link "Sign Up"
      fill_in 'Email', with: user.email
      fill_in 'Username', with: user.username
      fill_in 'Password', with: user.password
      fill_in 'Password Confirmation', with: user.password

      within 'form' do
        click_button 'Sign up'
      end
      expect( page ).to have_content('Thanks for creating an account!')
    end
  end
end