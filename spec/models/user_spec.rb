require 'rails_helper'

RSpec.describe User, type: :model do
   describe 'Model.user' do
    context 'validates field name' do
      let(:user) { build(:user) }
      it 'creates a new instance of user' do
        expect(user).to be_a_new(User)
      end
      it 'username must be valid' do
        expect(user).to be_valid
      end
      it 'username must not be valid' do
        user.name = nil
        expect(user).to_not be_valid
      end
      it 'username length must be less than 30 characters' do
        user.name = '12y3hadiuha9dqidajsodiajsdoaisdoaisjda'
        expect(user).to_not be_valid
      end
    end
  end
end
