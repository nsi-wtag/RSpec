require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Factory.build(:group) }

  context 'Should validate' do
    it 'with name, description, size and group type present' do
      expect(group).to be_valid
    end

    it 'when leader is not present' do
      group.leader = nil
      expect(group).to be_valid
    end
  end

  context 'Should not be valid' do
    it 'when name is not present' do
      group.name = nil
      expect(group).not_to be_valid
    end
    
    it 'when description is not present' do
      group.description = nil
      expect(group).not_to be_valid
    end

    it 'when group type is not present' do
      group.group_type = nil
      expect(group).not_to be_valid
    end
  end

  context 'Size' do
    it 'should not be valid if size is not present' do
      group.size = nil
      expect(group).not_to be_valid
    end

    it 'should not be valid if size is more than 10' do
      group.size = 11
      expect(group).not_to be_valid
    end

    it 'should be valid if size less than 10' do
      group.size = 4
      expect(group).to be_valid
    end

    it 'should be valid if size is equal to 10' do
      group.size = 10
      expect(group).to be_valid
    end
  end
end
