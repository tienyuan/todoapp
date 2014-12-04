require 'rails_helper'
require 'rake'

describe 'todoapp rake task' do

  before :all do
    Rake.application.rake_require 'tasks/todoapp'
    Rake::Task.define_task(:environment)
    @task = create(:task, created_at: Time.now)
    @task2 = create(:task, created_at: 10.days.ago)
  end

  let(:run_rake_task) {
    Rake::Task[auto_delete_tasks].reenable
    Rake.application.invoke_task auto_delete_tasks
  }

  describe 'auto delete items' do
    let(:auto_delete_tasks) { 'auto_delete_tasks' }

    it "only older than 7 days" do
      run_rake_task
      expect(Task.count).to eq(1)
    end
  end
end
