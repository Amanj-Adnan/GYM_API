require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /create" do
    before(:all) do
      @user = create(:user)
    end

    it 'login and returen auth token' do
    
     post "/api/v1/auth/user/login", params:  {email:@user.email, password:@user.password}
     

     expect(JSON.parse(response.body)["data"]["attributes"]).to include("token")
     expect(response).to have_http_status(200)
    end
    
 end
end
