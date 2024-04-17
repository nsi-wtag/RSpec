require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  let(:group) { FactoryBot.create(:group) }

  context 'get /index' do 
    it 'should render index page' do
      get groups_path
      expect(response).to render_template :index
    end
  end

  context 'get /new' do
    it 'should render new page' do
      get new_group_path
      expect(response).to render_template :new
    end
  end

  contex 'get /edit' do
    it 'should render edit page' do
      get edit_group_path(group)
      expect(response).to render_template :edit
    end
  end

  context 'post /group' do
    it 'should create group with valid attributes' do
      post '/groups', params: { group: FactoryBot.attributes_for(:group) }
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eq('Group has been created successfully!')
    end

    it 'should not create group invalid attributes' do
      post '/groups', params: { group: FactoryBot.attributes_for(:group, name: nil) }
      expect(response).to render_template(:new)
      expect(flash[:notice]).to eq nil
    end
  end

  context 'put /group' do
    it 'should update a group with valid attributes' do
      put "/groups/#{group.id}", params: { group: FactoryBot.attributes_for(:group)}
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eq('Group was updated successfully!')
    end

    it 'should not update a group with invalid attributes' do
      put "/groups/#{group.id}", params: { group: FactoryBot.attributes_for(:group, name: nil)}
      expect(response).to render_template(:edit)
      expect(flash[:notice]).to eq nil
    end
  end

  context 'delete /group' do
    it 'should delete a group' do
      delete "/groups/#{group.id}"
      expect(response).to redirect_to groups_path
      expect(flash[:notice]).to eq "Group has been deleted!"
    end
  end
end
