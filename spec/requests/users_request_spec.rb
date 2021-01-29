require 'rails_helper'

RSpec.describe "UsersController", type: :request do
  let!(:user) { build :user }
  let(:token) { user.generate_token }
  let(:common_headers) { { 'Content-Type': "application/json" } }

  describe "POST /api/users" do
    context "when the user's information is valid to sign up" do
      before do
        post '/api/users', params: {
          user: {
            email: user.email,
            password: user.password,
            username: user.username
          }
        }
      end

      it 'is expected to respond with status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'is expected to respond with user information' do
        expect(json['user']["email"]).to eql(user.email)
        expect(json['user']["username"]).to eql(user.username)
      end
    end

    context "when the user's information is invalid to sign up" do
      before do
        post '/api/users', params: {
          user: {
            email: nil,
            password: user.password,
            username: user.username
          }
        }
      end

      it 'is expected to respond with status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'is expected to have response with errors information' do
        expect(json['errors']["email"].first).to match(/can't be blank/)
      end
    end
  end

  describe "POST /api/users/login" do
    context "when the user's information is valid to login" do
      before do
        user.save
        post '/api/users/login', params: {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      it "is expected to respond with status code 200" do
        expect(response).to have_http_status(200)
      end

      it 'is expected to respond with user information' do
        expect(json['user']['id']).to eql(user.id)
      end
    end

    context "when the user's information is invalid to login" do
      before do
        post '/api/users/login', params: {
          user: {
            email: 'example@email.com',
            password: 'pass123456'
          }
        }
      end

      it "is expected to respond with status code 401" do
        expect(response).to have_http_status(401)
      end

      it 'is expected to respond with errors information' do
        expect(json['errors']['login'].first).to match(/is invalid/)
      end
    end
  end

  describe "GET /api/user" do
    context "when the user request their own data, and have a valid token" do
      before do
        user.save
        post '/api/users/login', params: {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      it "is expected to respond with status code 200" do
        token = json['user']['token']
        get '/api/user', headers: { Authorization: "Token #{token}" }
        expect(response).to have_http_status(200)
      end

      it 'is expected to respond with the user information' do
        token = json['user']['token']
        get '/api/user', headers: { Authorization: "Token #{token}" }
        expect(json["user"]["id"]).to eql(user.id)
        expect(json["user"]["email"]).to eql(user.email)
        expect(json["user"]["username"]).to eql(user.username)
        expect(json["user"]["image"]).to eql(user.image)
      end
    end

    context "when the user request contains an invalid token" do
      before do
        get '/api/user', headers: { Authorization: "Token #{user.generate_token}" }
      end

      it "is expected to respond with status code 401" do
        expect(response).to have_http_status(401)
      end

      it 'is expected to respond with "HTTP Token: Access denied."' do
        expect(response.body).to match(/HTTP Token: Access denied./)
      end
    end
  end
end
