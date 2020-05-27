require 'rails_helper'

RSpec.describe Travel, type: :model do
  describe 'Model.travel' do
    context 'validates travel object' do
      subject { build(:travel) }
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:text) }
      it {
        should validate_length_of(:title)
          .is_at_least(10)
      }
      it {
        should validate_length_of(:text)
          .is_at_least(100)
      }
    end
  end
end
