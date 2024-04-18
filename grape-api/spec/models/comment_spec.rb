require 'spec_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    context 'when writing a new comment' do
      it 'is invalid without an author' do
        expect(FactoryBot.build(:comment, author: nil)).not_to be_valid
      end

      it 'is invalid without a content' do
        expect(FactoryBot.build(:comment, content: nil)).not_to be_valid
      end

      it 'is invalid without an associated post' do
        expec(FactoryBot).build(:comment, post: nil).not_to be_valid
      end

      it 'is valid with an author, content and a post' do
        expect(FactoryBot.build(:comment)).to be_valid
      end
    end
  end
end
