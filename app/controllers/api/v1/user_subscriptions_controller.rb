class Api::V1::UserSubscriptionsController < ApplicationController
    before_action :authorized
    before_action :set_user_sub, only: [:update]
    def index 

       if @current_user.user_subscription == nil
         render json: {msg: "there is an error"}
       else
         render jsonapi: @current_user.user_subscription ,status: 200
       end
        
    end

    def show

        if @current_user.user_subscription == nil
          render json: {msg: "there is an error"}
        else
          render jsonapi: @current_user.user_subscription.last ,status: 200
        end

    end

    def create
      @user_sub = @current_user.user_subscription.create!(get_params)

      if @user_sub.save
        render jsonapi:@user_sub, status: 201
      else
        render jsonapi_errors: @user_sub.errors
      end
     
    end

    def update
      @user_sub= set_user_sub
      authorize! :update, @user_sub
      if @user_sub.update(get_params)

        render jsonapi:@user_sub,status: 200
      else
        render jsonapi_errors: @user_sub.errors
      end
    end

    def destroy
    end

    private

    def set_user_sub
      @id = params.permit(:id)["id"]

      return UserSubscription.find(@id)
    end
   
    def get_params
        params.permit(:monthly_remittance,:start_date,:end_date)
    end

end
