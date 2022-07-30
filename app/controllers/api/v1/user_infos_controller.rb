class Api::V1::UserInfosController < ApplicationController
    # load_and_authorize_resource
    before_action :authorized
    # before_action :set_user_info , only: [:update]


    def show
      
        render jsonapi: @current_user.user_info ,status: 200
    end

    def create
      
      if User.without_user_profiles.includes(@current_user)
        @user_info = @current_user.build_user_info(get_params)

        if @user_info.save
          render jsonapi:@user_info, status: 201
        else
          render jsonapi_errors: @user_info.errors
        end
       
      else
        render json: {msg: "the profile already created"}, status: 406
      end
    end

    def update
      @user_info= @current_user.user_info
      authorize! :update, @user_info
      if @user_info.update(get_params)

        render jsonapi:@user_info,status: 200
      else
        render jsonapi_errors: @user_info.errors
      end
    end

    private

     def get_params
       params.permit(:gender,:mobile_number,:weight,:height,:birth_date,:images)
     end

    #  def set_user_info
    #   @user_info =UserInfo.find(params[:id])
    # end
end
