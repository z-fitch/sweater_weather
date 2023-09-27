require 'rails_helper'

RSpec.describe 'Create', type: :request do
  describe 'GET /api/v0/road_trip', :vcr do
    context 'When a location is used' do
      it 'should return the needed infomation for the roadtrip if location is valid', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever123456@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload = { 
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": User.last.api_key
        }
        body = JSON.generate(payload)
    
        post '/api/v0/road_trip', headers: headers, params: body

        expect(response).to be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)

        expect(response_data[:data]).to have_key(:id)
        expect(response_data[:data][:id]).to be_a(String)
        expect(response_data[:data][:id]).to eq("null")

        expect(response_data[:data]).to have_key(:type)
        expect(response_data[:data][:type]).to be_a(String)
        expect(response_data[:data][:type]).to eq("road_trip")

        expect(response_data[:data]).to have_key(:attributes)
        expect(response_data[:data][:attributes]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:start_city)
        expect(response_data[:data][:attributes][:start_city]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:end_city)
        expect(response_data[:data][:attributes][:end_city]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:travel_time)
        expect(response_data[:data][:attributes][:travel_time]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:weather_at_eta)
        expect(response_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)

        expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
        expect(response_data[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)

        expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(response_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

        expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:condition)
        expect(response_data[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
      end

      it 'should return the needed infomation for the roadtrip if location is Invalid', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever123456@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload = { 
          "origin": "Cincinatti,OH",
          "destination": "London, UK",
          "api_key": User.last.api_key
        }
        body = JSON.generate(payload)
    
        post '/api/v0/road_trip', headers: headers, params: body

        expect(response).to be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)

        expect(response_data[:data]).to have_key(:id)
        expect(response_data[:data][:id]).to be_a(String)
        expect(response_data[:data][:id]).to eq("null")

        expect(response_data[:data]).to have_key(:type)
        expect(response_data[:data][:type]).to be_a(String)
        expect(response_data[:data][:type]).to eq("road_trip")

        expect(response_data[:data]).to have_key(:attributes)
        expect(response_data[:data][:attributes]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:start_city)
        expect(response_data[:data][:attributes][:start_city]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:end_city)
        expect(response_data[:data][:attributes][:end_city]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:travel_time)
        expect(response_data[:data][:attributes][:travel_time]).to be_a(String)
        expect(response_data[:data][:attributes][:travel_time]).to eq("Impossible")

        expect(response_data[:data][:attributes]).to have_key(:weather_at_eta)
        expect(response_data[:data][:attributes][:weather_at_eta]).to be_a(String)
        expect(response_data[:data][:attributes][:weather_at_eta]).to eq("")
      end
    end

    context 'the api_key does not is invaild' do 
      it 'should not give a response if no key is sent in', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever123456@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload = { 
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": nil
        }
        body = JSON.generate(payload)
    
        post '/api/v0/road_trip', headers: headers, params: body

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Key not Authorized")
      end

      it 'should not give a response if no key is sent in', :vcr do
        headers_create = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload_create = { 
          "email": "whatever123456@example.com",
          "password": "password",
          "password_confirmation": "password"
        }
        body_create = JSON.generate(payload_create)
    
        post '/api/v0/users', headers: headers_create, params: body_create

        headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
        payload = { 
          "origin": "Cincinatti,OH",
          "destination": "Chicago,IL",
          "api_key": "hahanotahackeriswear"
        }
        body = JSON.generate(payload)
    
        post '/api/v0/road_trip', headers: headers, params: body

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Key not Authorized")
      end
    end
  end
end