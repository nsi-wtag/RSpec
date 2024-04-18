require 'spec_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    context 'when creating a new tag' do
      it 'is valid with a name and a slug' do
        expect(FactoryBot.build(:tag)).to be_valid
      end

      it 'is invalid without a name' do
        expect(FactoryBot.build(:tag, name: nil)).not_to be_valid
      end

      it 'is invalid without a slug' do
        expect(FactoryBot.build(:tag, slug: nil)).not_to be_valid
      end

      it 'is invalid with a duplicated slug in the same post' do
        post = FactoryBot.build(:post)
        FactoryBot.create(:tag, post: post)
        expect(FactoryBot.build(:tag, post: post)).not_to be_valid
      end
    end
  end
end
