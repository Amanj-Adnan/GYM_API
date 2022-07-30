class ApplicationController < ActionController::API
  include ::ActionController::Cookies
    include JsonWebToken


   def current_user
    if logged_in_user
        @current_user
    else
        nil
     end
   end

   rescue_from CanCan::AccessDenied do |exception|  
    render json: {error: "Access denied!"},status: 401
  end
end
