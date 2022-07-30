module JsonWebToken
  extend ActiveSupport::Concern
  @hmac_secret = 'kurdistan'
  @algorithm_type = "HS256"
   

  def encode_token(payload)
    @hmac_secret = Rails.application.credentials.jwt[:hmac_secret]
    @algorithm_type =  Rails.application.credentials.jwt[:algorithm_type]
   
    
   JWT.encode payload, @hmac_secret, @algorithm_type
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
    
  end

  def decoded_token
     @hmac_secret = 'kurdistan'
     @algorithm_type = "HS256"
    if auth_header
      token = auth_header.split(' ').last
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, @hmac_secret, true, algorithm: @algorithm_type)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
    # else
      
    #   render json: { message: 'Please noo' }
    # end
  end
    
  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  # def current_user
  #   if user_logged_in?
  #       @user
  #   end
  # end

end