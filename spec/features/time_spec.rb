require 'rails_helper'

describe "task workflows" do

  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = create(:user)
    login_as(@user, :scope => :user)
  end

  describe "sucessfully" do
    it "sees time left for a task" do
      @task = create(:task, user: @user, created_at: 5.days.ago)
      visit tasks_path
      expect( page ).to have_content('2 days left')
    end
  end

  after do
    Warden.test_reset!
  end

end