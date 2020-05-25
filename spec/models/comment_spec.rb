require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Model.comment' do
    context 'validates comment object' do
      subject { build(:comment) }
      it { should validate_presence_of(:author_name) }
      it { should validate_presence_of(:body) }
      it {
        should validate_length_of(:author_name)
          .is_at_least(6)
      }
      it {
        should validate_length_of(:body)
          .is_at_least(10)
      }
    end
  end
end
