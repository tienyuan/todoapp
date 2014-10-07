require 'rails_helper'

describe TasksController do
  
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
  end

  describe '#index' do
    it "shows a empty list" do
      get :index
      expect( response ).to have_http_status(:ok)
      expect( @user.tasks.empty? ).to eq(true)
    end

    it "shows a list of uncompleted tasks" do
      task = create(:task, user: @user)
      task = create(:task, user: @user, completed: true)
      get :index
      expect( response ).to have_http_status(:ok)
      expect( @user.tasks.count ).to_not eq(1)
    end
  end

  describe '#new' do
    it "makes a new task without saving" do
      expect( @user.tasks.empty? ).to eq(true)

      post :new, task:{ description: "Some test description", user: @user}
      expect( @user.tasks.empty? ).to eq(true)
    end
  end

  describe '#create' do
    it "creates a task" do
      expect( @user.tasks.empty? ).to eq(true)

      post :create, task:{ description: "Some test description", user: @user}
      expect( @user.tasks.count ).to eq(1)
    end
  end

  describe '#update-completed' do
    it "updates a task to be completed" do
      task = create(:task, user: @user)
      expect( task.completed ).to eq(false)

      patch :update, id: task.id, task:{completed: true}
      task.reload
      expect( task.completed ).to eq(true)
    end
  end

  describe '#destroy' do
    it "deletes a task" do
      task = create(:task, user: @user)
      delete :destroy, id: task.id
      expect( @user.tasks.count ).to eq(0)
    end
  end

end