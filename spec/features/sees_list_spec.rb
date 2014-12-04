require 'rails_helper'

feature 'User goes to task list' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, scope: :user)
  end

  scenario 'sees task description' do
    create(:task, description: 'task description', user: @user)
    visit tasks_path
    expect(page).to have_content('task description')
  end

  scenario 'sees time left for a task' do
    create(:task, user: @user, created_at: 5.days.ago)
    visit tasks_path
    expect(page).to have_content('2 days left')
  end

  scenario 'sees no tasks are listed' do
    visit tasks_path
    expect(page).to have_content('No todos are pending.')
  end

  after do
    Warden.test_reset!
  end
end
