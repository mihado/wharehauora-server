require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:bedroom) { FactoryGirl.create(:room_type, name: 'bedroom') }

  let(:user) { FactoryGirl.create(:user) }
  let(:home) { FactoryGirl.create(:home, owner_id: user.id) }
  let(:room) { FactoryGirl.create(:room, home: home, room_type: bedroom) }
  let(:sensor) { FactoryGirl.create(:sensor, room: room, node_id: '1100') }

  context 'Not signed in' do
    describe 'GET show' do
      before { get :show, home_id: room.home.id, id: room.id }
      it { expect(response).to redirect_to(new_user_session_path) }
    end
  end

  context 'user is signed in as owner' do
    before { sign_in user }

    describe 'GET show' do
      before { get :show, home_id: room.home.id, id: room.id }
      it { expect(response).to have_http_status(:success) }
    end

    describe '#update' do
      before do
        patch :update, home_id: room.home.id, id: room.to_param,
                       room: { name: 'Living room' }
      end
      it { expect(response).to redirect_to home_rooms_path(home) }
    end
  end

  context 'user is signed in as whānau' do
    let(:whanau) { FactoryGirl.create :user }

    before do
      home.users << whanau
      sign_in whanau
    end

    describe 'GET show' do
      before { get :show, home_id: room.home.id, id: room.id }
      it { expect(response).to have_http_status(:success) }
    end

    describe '#update' do
      before do
        patch :update, home_id: room.home.id, id: room.to_param,
                       room: { name: 'Living room' }
      end
      it { expect(response).to have_http_status(:redirect) }
    end
  end

  context "Trying to access another users's data" do
    before { sign_in user }
    describe "GET edit for someone else's home" do
      let(:home) { FactoryGirl.create(:home) }
      let(:room) { FactoryGirl.create(:room, home: home) }

      describe '#show' do
        before { get :show, home_id: home.id, id: room.to_param }
        it { expect(response).to have_http_status(:not_found) }
      end
      describe '#edit' do
        before { get :edit, home_id: home.id, id: room.to_param }
        it { expect(response).to have_http_status(:not_found) }
      end
    end
  end
end
