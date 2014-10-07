require 'rails_helper'

feature "User list" do #rename to user_sees_list and add test for seeing a task correctly

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  feature "displays" do
    scenario "a task description" do
      task = create(:task, description: 'task description', user: @user)
      visit tasks_path
      expect( page ).to have_content('task description')
    end

    scenario "time left for a task" do
      task = create(:task, user: @user, created_at: 5.days.ago)
      visit tasks_path
      expect( page ).to have_content('2 days left')
    end
  end

  after do
    Warden.test_reset!
  end

end