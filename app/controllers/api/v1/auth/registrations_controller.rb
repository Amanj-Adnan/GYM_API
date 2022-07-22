module Api
    class V1::Auth::RegistrationsController < ApplicationController
        
        def create
          @user=User.new(user_params)
            if @user.valid? && @user.save
              token = encode_token({user_id: @user.id})
            #  render status: 200 , json:{success: true,info: "created account sucessfully.",token:token ,user:@user} 
            #  response.headers["auth_token"] = token
            render jsonapi: @user,expose: {token: token}, status: 201
            else
                render jsonapi_errors: @user.errors , status: 	406
            end
          end

         private
       
         def user_params
           params.permit(:name,:email, :password , :password_confirmation)
         end
        
          

         
    end
end


 