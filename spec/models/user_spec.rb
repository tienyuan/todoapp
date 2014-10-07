require 'rails_helper'

describe Task do 

  describe "class methods" do
    before do
      @user = create(:user)
    end

    describe "ActiveRecord associations" do
      it { expect(@user).to have_many(:tasks).dependent(:destroy) }
    end
  end
end