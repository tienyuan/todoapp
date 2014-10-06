require 'rails_helper'

describe "Task workflow" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  describe "sucessfully" do
    it "creates a task" do
      visit tasks_path
      click_link "Create a New Todo"
      fill_in 'Description', with: "some task description here"

      within 'form' do
        click_button 'Submit'
      end
      expect( page ).to have_content('Todo created!')
    end
  end

  describe "sucessfully", js: true do
    it "completes a task" do
      @task = create(:task, user: @user)
      visit tasks_path
      check("task[completed]")

      expect( page ).to have_content('Todo completed!')
    end
  end


  after do
    Warden.test_reset!
  end

end