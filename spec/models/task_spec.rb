require 'rails_helper'

describe Task do

  describe 'class methods' do
    before do
      @user = create(:user)
      @new_task = create(:task, user: @user, created_at: Timecop.freeze(Time.now))
      @old_task = create(:task, user: @user, created_at: 7.days.ago)
      @completed_task = create(:task, user: @user, completed: true)
    end

    describe '#expiration_date' do
      it 'for the maximum' do
        expect(@new_task.expiration_date).to eq(Time.now + 7.days)
      end

      it 'for the minimum' do
        expect(@old_task.expiration_date).to eq(Time.now)
      end
    end

    describe '#days_remaining' do
      it 'for the maximum' do
        expect(@new_task.days_remaining).to eq(7)
      end

      it 'for the minimum' do
        expect(@old_task.days_remaining).to eq(0)
      end
    end

    describe '#hide_completed scope' do
      it 'does not include completed tasks' do
        expect(Task.hide_completed).not_to include(@completed_task)
      end
    end

    describe '.delete_tasks' do
      it 'deletes old and completed tasks' do
        Task.delete_tasks
        expect(Task.count).to eq(1)
      end
    end

    describe 'ActiveModel validations' do
      it { expect(@new_task).to validate_presence_of(:description).with_message(/can't be blank/) }
      it { ensure_inclusion_of(:completed).in_array([true, false]) }
    end

    describe 'ActiveRecord associations' do
      it { expect(@new_task).to belong_to(:user) }
      it { expect(@new_task).to have_db_index(:user_id) }       
    end
  end
end
