require 'rails_helper'

RSpec.describe Vote, type: :model do
    describe 'add a vote to a travelling article' do
      it 'adds a new vote' do
        @text = 'sja bkajsbkas ajsn jbdkasj' * 10
        @user = User.new(name: 'User')
        @travel = Travel.new(title: 'test travel article', text: @text, author_id: @user.id, image: '/image.jpg')
        @vote = Vote.new(user: @user, travel: @travel)
  
        expect(@vote).to be_a_new(Vote)
      end
    end
end