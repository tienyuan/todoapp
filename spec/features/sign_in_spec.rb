require 'rails_helper'

describe "Sign in workflow" do

  describe "successful" do
    it "redirects to the list index" do
    user = create(:user)
    visit root_path

    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password

    within 'form' do
      click_button 'Sign in'
    end

    expect(current_path).to eq lists_path
    end
  end
end