require 'rails_helper'

RSpec.describe "UserInfos", type: :request do
  before(:all) do
    @user = create(:user)
    @token = login_as(@user)
  end
  describe "GET /show" do
     it 'return curent_useer profile' do
      @user_info = create(:user_info, user: @user)
      get "/api/v1/user/user_info", headers: { 'Authorization': 'Bearer ' + @token}
      expect(JSON.parse(response.body)["data"]["attributes"]["user_id"]).to  eq(@user.id)
      expect(response).to have_http_status(200)
     end
     
  end

  describe "POST /create" do
    it 'creates profile for the exist user' do
      
      
      post "/api/v1/user/user_info", params:  {gender:"Male" ,birth_date:"1999-01-01", mobile_number:"+944937040625", height:"185",weight:"85" } , headers: { 'Authorization': 'Bearer ' + @token}
      
      expect(JSON.parse(response.body)["data"]["attributes"]["user_id"]).to  eq(@user.id)
      expect(response).to have_http_status(201)
     end
  end


  describe "PUT /update" do
     
    it 'udeate user profile' do
      @user_info = create(:user_info, user: @user)
      put "/api/v1/user/user_info", params:  {gender:"Male" ,birth_date:"1999-01-01", mobile_number:"+944937040625", height:"200",weight:"200" } , headers: { 'Authorization': 'Bearer ' + @token}
      expect(JSON.parse(response.body)["data"]["attributes"]["height"]).to  eq('200')
      expect(JSON.parse(response.body)["data"]["attributes"]["weight"]).to  eq('200')
      expect(response).to have_http_status(200)
    end
    
  end
end
