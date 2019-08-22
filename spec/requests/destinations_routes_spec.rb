require 'rails_helper'

  describe "get all destinations route", :type => :request do

    before(:each) { Destination.destroy_all }

  User.delete_all
  Destination.delete_all

  describe 'get destinations route', type: :request do
    FactoryBot.create_list(:destination, 20)
  end

  before do
    FactoryBot.create_list(:destination, 20)
    get '/destinations'
  end

  URL = '/destinations'
  user = FactoryBot.create(:user)
  def authenticated_header(user)
    token = JsonWebToken.encode(user_id: user.id)
    { 'Authorization': "#{token}" }
  end

  it 'returns status code 200' do
    get URL, headers: authenticated_header(user)
    expect(response).to have_http_status(:success)
  end

  it 'returns all destinations' do
    get URL, headers: authenticated_header(user)
    expect(JSON.parse(response.body).size).to eq(20)
  end

end
