require 'rails_helper'

RSpec.describe "UserSubscriptions", type: :request do
  before(:all) do
    @user = create(:user)
    @token = login_as(@user)
  end

  describe "GET /index" do
    it 'returns current user all subscriptions' do
      @user_sub = create(:user_subscription, user: @user)
      get "/api/v1/user/subscriptions", headers: { 'Authorization': 'Bearer ' + @token}

      expect(JSON.parse(response.body)["data"]).not_to  eq(nil)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /show" do
    it 'returns current user last subscription' do
      @user_sub = create(:user_subscription, user: @user)

      get "/api/v1/user/subscription", headers: { 'Authorization': 'Bearer ' + @token}
      expect(JSON.parse(response.body)["data"]["attributes"]["user_id"]).to  eq(@user.id)
      
      expect(response).to have_http_status(200)
    end
    
  end
  
  describe "post /create" do
    it 'create new  subscription' do
      post "/api/v1/user/subscription", params:  {monthly_remittance:"100" ,start_date:"2022-02-01",end_date:"2022-03-01"} , headers: { 'Authorization': 'Bearer ' + @token}
      
      expect(JSON.parse(response.body)["data"]["attributes"]["user_id"]).to  eq(@user.id)
      expect(response).to have_http_status(201)
    end
  end

  describe "put/update" do
    it 'update subscription' do
      @user_sub = create(:user_subscription, user: @user)

      put "/api/v1/user/subscription", params: {id:@user_sub.id ,monthly_remittance:"999" ,start_date:@user_sub.start_date,end_date:@user_sub.end_date} , headers: { 'Authorization': 'Bearer ' + @token}
      expect(JSON.parse(response.body)["data"]["attributes"]["monthly_remittance"]).to  eq(999)
      expect(response).to have_http_status(200)
    end
  end
end
