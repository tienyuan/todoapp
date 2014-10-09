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
      expect( response ).to have_http_status(:success)
      expect( assigns(:message) ).to eq("No todos are pending.")
    end

    it "shows a list of uncompleted tasks" do
      task = create(:task, user: @user)
      task2 = create(:task, user: @user, completed: true)
      
      get :index
      expect( response ).to have_http_status(:success)
      expect( (assigns(:tasks)) ).to eq([task])
    end
  end

  describe '#new' do
    it "makes a new task without saving" do
      post :new

      expect( response ).to have_http_status(:success)
      expect( response ).to render_template(:new)
    end
  end

  describe '#create' do
    it "creates a task" do
      params = { description: "Some test description", user: @user}
      post :create, task: params

      expect( response ).to redirect_to tasks_path
      expect(flash[:notice]).to eq "Todo created!"
    end

    it "fails to create a task without a description" do
      params = { description: "", user: @user}
      post :create, task: params

      expect( response ).to have_http_status(:success)
      expect( response ).to render_template(:new)
      expect(flash[:error]).to eq "Error creating todo. Please try again."
    end
  end

  describe '#update-completed' do
    it "updates a task to be completed" do
      task = create(:task, user: @user)
      patch :update, id: task.id, task:{completed: true}
      task.reload

      expect( response ).to redirect_to tasks_path
      expect(flash[:notice]).to eq "Todo completed!"
    end

    it "fails to updates a task" do
      task = create(:task, user: @user)     
      patch :update, id: task.id, task:{completed: "taco"}

      expect( response ).to redirect_to tasks_path
      expect(flash[:error]).to eq "There was an error updating the todo."
    end
  end

  describe '#destroy' do
    it "deletes a task" do
      task = create(:task, user: @user)
      delete :destroy, id: task.id

      expect( response ).to redirect_to tasks_path
      expect(flash[:notice]).to eq "Todo was deleted successfully."
    end
  end

end