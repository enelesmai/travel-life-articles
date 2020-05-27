require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model.user' do
    context 'validates User model' do
      subject { build(:user) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
      it {
        should validate_length_of(:name)
          .is_at_most(30)
          .on(:create)
      }
    end
  end
end
