require 'rails_helper'

RSpec.describe 'Index', type: :request do
  describe 'GET /api/v1/book-search?', :vcr do
    context 'When a valid params is used' do
      it 'should return the details of books about the city', :vcr do
        
        get "/api/v1/book-search?location=denver,co&quantity=5"

        expect(response).to be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response_data[:data]).to have_key(:id)
        expect(response_data[:data][:id]).to be_a(String) 
        expect(response_data[:data][:id]).to eq("null") 

        expect(response_data[:data]).to have_key(:type)
        expect(response_data[:data][:type]).to be_a(String)
        expect(response_data[:data][:type]).to eq("books")

        expect(response_data[:data]).to have_key(:attributes)
        expect(response_data[:data][:attributes]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:destination)
        expect(response_data[:data][:attributes][:destination]).to be_a(String)

        expect(response_data[:data][:attributes]).to have_key(:forecast)
        expect(response_data[:data][:attributes][:forecast]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:total_books_found)
        expect(response_data[:data][:attributes][:total_books_found]).to be_a(Integer)

        expect(response_data[:data][:attributes]).to have_key(:books)
        expect(response_data[:data][:attributes][:books]).to be_a(Array)
      end
    end

    context 'When a Invalid param is used' do
      it 'should return an error if given 0', :vcr do
        
        get "/api/v1/book-search?location=denver,co&quantity=0"

        expect(response).to_not be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(404)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Quantity Must be a Valid Number")
      end

      it 'should return an error if given -2', :vcr do
        
        get "/api/v1/book-search?location=denver,co&quantity=-1"

        expect(response).to_not be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(404)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Quantity Must be a Valid Number")
      end
    end
  end
end