require 'rails_helper'

describe "Sign in workflow" do

  describe "successfully" do
    it "redirects to the task index" do
    user = create(:user)
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    within 'form' do
      click_button 'Sign in'
    end

    expect(current_path).to eq tasks_path 
    end
  end
  
  describe "unsuccessfully" do
    it "reminds user to login" do
    visit tasks_path

    expect( page ).to have_content('Please sign in.')
    end
  end

end