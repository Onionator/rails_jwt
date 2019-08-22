require 'rails_helper'

describe 'destination routes' do

  before(:each) { Destination.destroy_all }

  describe 'get destinations route', type: :request do
    FactoryBot.create_list(:destination, 20)

    before do
      FactoryBot.create_list(:destination, 20)
      get '/destinations'
    end

    it 'returns all destinations' do
      expect(JSON.parse(response.body).size).to eq(20)
    end

    it 'returns status code 200' do
      byebug
      expect(response).to have_http_status(:success)
    end
  end
end
