require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'Model.Vote' do
    context 'add a vote to a travelling article' do
      let(:travel) { build(:travel) }
      let(:user) { build(:user) }
      it 'adds a new vote' do
        @vote = Vote.new(user: @user, travel: @travel) 
        expect(@vote).to be_a_new(Vote)
      end
    end
  end
end
