class Api::V1::Auth::SessionsController < ApplicationController
  
  before_action :authorized ,only: [:destory]



  # LOGGING IN
  def create
  
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      cookies.signed[:token] = {value:  token, httponly: true}
       render jsonapi: @user,expose: {token: token},status: 200
       
      #  render jsonapi: @user,relationship: :user_info,expose: {token: token}
    else
      render json: {error: "Invalid username or password"}, status: 	406
    end
  end
  

  def destroy
    
  end



  private

  def user_params
    params.permit(:email, :password)
  end

end
