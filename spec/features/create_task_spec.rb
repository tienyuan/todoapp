require 'rails_helper'

describe "create task workflow" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  describe "new task" do
    it "shows form" do
      visit tasks_path
      click_link "Create a New Todo"
      fill_in 'Description', with: "some task description here"

      within 'form' do
        click_button 'Create'
      end
      expect( page ).to have_content('Todo created!')
    end
  end

  after do
    Warden.test_reset!
  end

end