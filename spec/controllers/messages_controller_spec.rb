require 'rails_helper'

describe MessagesController do
   let(:group) { create(:group) }
   let(:user) { create(:user) }
   let(:message) { build(:message) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user
      end
      it "@groupsの値が適切" do
        get :index, group_id: group
        expect(assigns(:group)).to eq group
      end

      it "@Messageの値が適切" do
        get :index, group_id: group
        expect(assigns(:message)).to be_a_new Message
      end

      it "indexに遷移" do
        get :index, group_id: group
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST #create' do
    context 'ログインしているかつ、保存に成功した場合' do
      before do
        login_user
      end
      it "messageがsaveされる" do
        expect{
          post :create, group_id: group, message: attributes_for(:message)}.to change(Message, :count).by(1)
      end

      it "indexに移動" do
        post :create, group_id: group, message: attributes_for(:message)
        expect(response).to redirect_to group_messages_path
      end
    end

    context 'ログインしているが、保存に失敗した場合' do
      before do
        login_user
      end
      it "messageがsaveされない" do
        expect{
          post :create, group_id: group, message: attributes_for(:message, body: nil, image: nil)
        }.not_to change(Message, :count)
      end
    end

    context 'ログインしていない場合' do
      it "ログインページに移動" do
        post :create, group_id: group
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end
