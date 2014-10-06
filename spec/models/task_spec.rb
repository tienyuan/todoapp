require 'rails_helper'

describe Task do 

  describe "class methods" do
    before do
      @new_task = create(:task, created_at: Timecop.freeze(Time.now))
      @old_task = create(:task, created_at: 7.days.ago)
      @completed_task = create(:task, completed: true)
    end

    describe '#expiration_date' do
      it "for the maximum" do
        expect( @new_task.expiration_date ).to eq(Time.now + 7.days)
      end

      it "for the minimum" do
        expect( @old_task.expiration_date ).to eq(Time.now)
      end
    end

    describe '#days_remaining' do
      it "for the maximum" do
        expect( @new_task.days_remaining ).to eq(7)
      end

      it "for the minimum" do
        expect( @old_task.days_remaining ).to eq(0)
      end
    end

    describe '#hide_completed scope' do 
      it "does not include completed tasks" do
        expect( Task.hide_completed ).not_to include(@completed_task)
      end
    end

    describe '#validation' do  
      it "does not allow empty description" do
        task = Task.new(description: "", user: @user)
        expect( task.save ).to eq(false)
      end
    end

    describe '.delete_tasks' do  
      tasks = Task.all
      it { expect( tasks.count ).to eq(3) }
      Task.delete_items
      it { expect( tasks.count ).to eq(1) }
    end

  end
end