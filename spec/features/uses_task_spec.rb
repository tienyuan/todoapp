require 'rails_helper'

feature "Task" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  feature "creates" do
    scenario "a task given a description" do
      visit tasks_path
      click_link "Create a New Todo"
      fill_in 'Description', with: "some task description here"

      within 'form' do
        click_button 'Submit'
      end
      
      expect( page ).to have_content('Todo created!')
    end
  end

  feature "completes", js: true do
    scenario "a task with a checkbox" do
      current_user.task = create(:task, user: @user)
      visit tasks_path
      check("task[completed]")

      expect( page ).to have_content('Todo completed!')
    end
  end

  after do
    Warden.test_reset!
  end

end