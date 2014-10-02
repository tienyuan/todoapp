require 'rails_helper'

describe "create a task workflow" do

  describe "successful" do
    it "redirects to the task index" do
    user = create(:user)
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    within 'form' do
      click_button 'Sign in'
    end

    expect(current_path).to eq root_path #when there's a task index, change to tasks_path
    end
  end
end