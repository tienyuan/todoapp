require 'rails_helper'

feature 'User goes to task list to' do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  scenario 'create a task with description' do
    visit tasks_path
    click_link 'Create a New Todo'
    fill_in 'Description', with: 'some task description here'

    within 'form' do
      click_button 'Submit'
    end
      
    expect(page).to have_content('Todo created!')
  end

  scenario 'complete a task' do
    create(:task, user: @user)
    visit tasks_path
    click_button 'X'

    expect(page).to have_content('Todo completed!')
  end

  scenario 'complete a task with ajax', js: true do
    create(:task, user: @user)
    visit tasks_path
    click_button 'X'

    expect(page).to have_content('Todo completed!')
  end

  after do
    Warden.test_reset!
  end
end
