require 'rails_helper'

describe Task do 

  describe "class methods" do
    before do
      @newtask = create(:task, created_at: Timecop.freeze(Time.now))
      @oldtask = create(:task, created_at: 7.days.ago)
      @completedtask = create(:task, completed: true)
    end

    describe '#expiration_date' do
      it "for the maximum" do
        expect( @newtask.expiration_date ).to eq(Time.now + 7.days)
      end
    end

    describe '#expiration_date' do
      it "for the minimum" do
        expect( @oldtask.expiration_date ).to eq(Time.now)
      end
    end

    describe '#days_remaining' do
      it "for the maximum" do
        expect( @newtask.days_remaining ).to eq(7)
      end
    end

    describe '#days_remaining' do
      it "for the minimum" do
        expect( @oldtask.days_remaining ).to eq(0)
      end
    end
    
    describe '#hide_completed scope' do
      it "does not include completed tasks" do
        expect( Task.hide_completed ).not_to include(@completedtask)
      end
    end

  end
end