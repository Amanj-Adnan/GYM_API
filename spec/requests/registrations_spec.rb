require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /create" do

     it 'creates user and returen auth token' do
      
      
     
      post "/api/v1/auth/user", params:  {name:"Amanj Adnan" ,email:"amanjadnan@gmail.com", password:"111111", password_confirmation:"111111" }
      
      # expect(response).to be_successful
      expect(JSON.parse(response.body)["data"]["attributes"]).to include("token")
      expect(response).to have_http_status(201)
     end
     
  end
end
