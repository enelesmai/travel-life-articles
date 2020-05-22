require 'rails_helper'

RSpec.describe Travel, type: :model do
  let('text') { 'sja bkajsbkas ajsn jbdkasj' * 10 }
  let!('user') { User.new(name: 'User') }
  let!('travel') { Travel.new(title: 'test travel article', text: text, author_id: user.id, image: '/image.jpg') }
  describe 'create' do
    it 'creates a new travel article object when input is valid' do
      expect(travel).to be_a_new(Travel)
    end
  end
end
