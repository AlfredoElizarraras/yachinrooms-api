require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
  let!(:user) { create :user }
  let!(:rooms) { create_list(:room, 70, host_id: user.id) }
  let(:room_id) { rooms.first.id }

  describe 'GET /api/rooms' do
    context 'when the request do not specify page and per page params' do
      before do
        get '/api/rooms'
      end

      it 'is expected to respond with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'is expected to return rooms' do
        expect(json['rooms']).not_to be_empty
      end

      it 'is expected to return no more than 20 records' do
        expect(json['rooms'].size).to eq(20)
      end

      it 'is expected to return the current page' do
        expect(json['currentPage']).to eq(1)
      end

      it 'is expected to return the rooms count' do
        expect(json['roomsCount']).to eq(20)
      end
    end

    context 'when the request includes both page and per page params' do
      before do
        permited_params = { indexing: { page: 3, per_page: 2 } }
        get '/api/rooms', params: permited_params
      end

      it 'is expected to respond with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'is expected to return rooms' do
        expect(json['rooms']).not_to be_empty
      end

      it 'is expected to return the current page' do
        expect(json['currentPage']).to eq(3)
      end

      it 'is expected to return the rooms count' do
        expect(json['roomsCount']).to eq(2)
      end
    end

    context 'when the request includes just the page param' do
      before do
        permited_params = { indexing: { page: 3 } }
        get '/api/rooms', params: permited_params
      end

      it 'is expected to return with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'is expected to return the current page' do
        expect(json['currentPage']).to eq(3)
      end

      it 'is expected to return no more than 20 records' do
        expect(json['rooms'].size).to eq(20)
      end
    end

    context 'when the request includes just the per page param' do
      before do
        permited_params = { indexing: { per_page: 3 } }
        get '/api/rooms', params: permited_params
      end

      it 'is expected to return with status 200' do
        expect(response).to have_http_status(200)
      end

      it 'is expected to return the first page' do
        expect(json['currentPage']).to eq(1)
      end

      it 'is expected to return the specified amount of records' do
        expect(json['roomsCount']).to eq(3)
      end
    end
  end

  describe 'GET /api/rooms/:id' do
    before { get "/api/rooms/#{room_id}" }

    context 'when the record exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the room' do
        expect(json).not_to be_empty
        expect(json['room']['id']).to eql(room_id)
      end
    end

    context 'when the record doesn\'t exists' do
      let(:room_id) { 0 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'return a not found message' do
        expect(json['message']).to match(/Couldn't find Room with 'id'=.*/)
      end
    end
  end
end
