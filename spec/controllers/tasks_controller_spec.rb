require 'rails_helper'

describe TasksController do
  
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
  end

  describe '#create' do
    it "creates a task" do
      expect( @user.tasks.empty? ).to eq(true)

      post :create, task:{ description: "Some test description", user: @user, completed: false }
      expect(@user.tasks.count).to eq(1)
    end
  end

  describe '#update-completed' do
    it "updates a task to completed" do
      @task = create(:task)
      expect( @task.completed ).to eq(false)

      post :edit, task:{ id: @task.id, completed: true}
      expect( @task.completed ).to eq(true)
    end
  end

end