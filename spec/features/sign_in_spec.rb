require 'rails_helper'

feature "Sign in" do

  feature "logs in" do
    scenario "by authenticating user and showing todo list" do
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
  
  feature "catches unauthenticated users" do
    scenario "and shows reminder to login" do
    visit tasks_path

    expect( page ).to have_content('Please sign in.')
    end
  end

end