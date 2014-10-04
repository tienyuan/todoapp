require 'rails_helper'

describe Task do 

  describe "time methods" do
    before do
      @newtask = create(:task, created_at: Timecop.freeze(Time.now))
      @oldtask = create(:task, created_at: 7.days.ago)
    end

    describe 'calculates expiration date' do
      it "for the maximum" do
        expect( @newtask.expiration_date ).to eq(Time.now + 7.days)
      end
    end

    describe 'calculates expiration date' do
      it "for the minimum" do
        expect( @oldtask.expiration_date ).to eq(Time.now)
      end
    end

    describe 'calculates days remaining' do
      it "for the maximum" do
        expect( @newtask.days_remaining ).to eq(7)
      end
    end

    describe 'calculates days remaining' do
      it "for the minimum" do
        expect( @oldtask.days_remaining ).to eq(0)
      end
    end

  end
end