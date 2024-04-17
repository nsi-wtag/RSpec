require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.build(:group) }
  let(:leader) { FactoryBot.build(:leader) }

  context 'Leader name' do
    it 'should return no liaison for this group if leader is not present' do
      group.leader = nil
      expect(group.leader_name).to eq('No leader for this group')
    end

    it 'should return full name of leader when leader is present' do
      leader.first_name = 'John'
      leader.last_name = 'Cena'
      group.leader = leader

      expect(group.leader_name).to eq('John Cena')
    end
  end
end
