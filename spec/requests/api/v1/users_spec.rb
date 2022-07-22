require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /index" do
     
    it 'returen list of users' do
      get "/api/v1/auth/users"
     
     expect(response).to have_http_status(200)
    end
  end
end
