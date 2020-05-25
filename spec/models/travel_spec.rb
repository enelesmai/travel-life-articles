require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe 'Model.travel' do
    context 'validates travel object' do
      let(:travel) { build(:travel)}
      it 'creates a new travel article object when input is valid' do
        expect(travel).to be_a_new(Travel)
      end  
    end
  end
end
