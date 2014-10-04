require 'rails_helper'
require 'rake'

describe 'todoapp rake task' do

  before :all do
    Rake.application.rake_require "tasks/todoapp"
    Rake::Task.define_task(:environment)
    @task = create(:task, created_at: Time.now)
    @task2 = create(:task, created_at: 10.days.ago)
  end

  let(:run_rake_task) {
    Rake::Task[delete_items].reenable
    Rake.application.invoke_task delete_items
  }

  describe 'delete items' do
    let(:delete_items) { "delete_items" }

    it "only older than 7 days" do
      run_rake_task
      expect(Task.count).to eq(1)
    end
  end
end