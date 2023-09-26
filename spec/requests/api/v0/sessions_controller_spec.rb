require 'rails_helper'

RSpec.describe 'Create', type: :request do
  describe 'POST /api/v0/sessions', :vcr do
    context 'Sending information through the body' do
      it 'should login a user', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers_login = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_login = {
          "email": "whatever@example.com",
          "password": "password"
        }
        body_login = JSON.generate(payload_login)
    
        post '/api/v0/sessions', headers: headers_login, params: body_login

        expect(response).to be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)

        expect(response_data[:data]).to have_key(:id)
        expect(response_data[:data][:id]).to be_a(String)

        expect(response_data[:data]).to have_key(:type)
        expect(response_data[:data][:type]).to be_a(String)
        expect(response_data[:data][:type]).to eq("user")

        expect(response_data[:data]).to have_key(:attributes)
        expect(response_data[:data][:attributes]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:email)
        expect(response_data[:data][:attributes][:email]).to be_a(String)
        expect(response_data[:data][:attributes][:email]).to eq("whatever@example.com")

        expect(response_data[:data][:attributes]).to have_key(:api_key)
        expect(response_data[:data][:attributes][:api_key]).to be_a(String)

        expect(response_data[:data][:attributes]).to_not have_key(:password)
        expect(response_data[:data][:attributes]).to_not have_key(:password_confirmation)
      end

      it 'should not login a user', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers_login = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_login = {
          "email": "wrong@example.com",
          "password": "password"
        }
        body_login = JSON.generate(payload_login)
    
        post '/api/v0/sessions', headers: headers_login, params: body_login

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Email or Password is Invaild")
      end

      it 'should not login a user', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers_login = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_login = {
          "email": "whatever@example.com",
          "password": "iamhacker"
        }
        body_login = JSON.generate(payload_login)
    
        post '/api/v0/sessions', headers: headers_login, params: body_login

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Email or Password is Invaild")
      end
    end
  end
end
