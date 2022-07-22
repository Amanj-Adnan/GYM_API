require 'rails_helper'

RSpec.describe "UserInfos", type: :request do
  before(:all) do
    @user = create(:user)
    @token = login_as(@user)
  end
  describe "GET /show" do
   
  end

  describe "POST /create" do
    it 'creates profile for the exist user' do
      
      
      post "/api/v1/user/user_info", params:  {gender:"Male" ,birth_date:"1999-01-01", mobile_number:"+944937040625", height:"185",weight:"85" } , headers: { 'Authorization': 'Bearer ' + @token}
  
      # expect(JSON.parse(response.body)["data"]["attributes"]).to include("token")
      expect(response).to have_http_status(201)
     end
  end


  describe "PUT /update" do
   
  end
end
