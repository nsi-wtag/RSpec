require 'spec_helper'

RSpec.describe Post, type: :model do
  it 'should have a valid factory' do
    expect(FactoryBot.build(:post)).to be_valid
  end

  describe 'validations' do
    it 'is invalid without a title' do
      expect(FactoryBot.build(:post, title: nil)).not_to be_valid
    end

    it 'is invalid without a slug' do
      expect(FactoryBot.build(:post, slug: nil)).not_to be_valid
    end

    it 'is invalid without a content' do
      expect(FactoryBot.build(:post, content: nil)).not_to be_valid
    end

    it 'is invalid with a duplicated slug' do
      FactoryBot.create(:post)
      expect(FactoryBot.build(:post)).not_to be_valid
    end
  end
end
