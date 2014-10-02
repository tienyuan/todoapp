require 'rails_helper'

describe "create task workflow" do

  describe "new task" do
    it "shows form" do
      @user = create(:user)
      current_user = @user
      visit tasks_path
      click_link "Create a New Todo"
      fill_in 'Description', with: "some task description here"

      within 'form' do
        click_button 'Create'
      end
      expect( page ).to have_content('Task created!')
    end
  end
end