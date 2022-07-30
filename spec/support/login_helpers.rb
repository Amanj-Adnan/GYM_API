module LoginHelpers
    def login_as(user)
          
    @hmac_secret = 'kurdistan'
    @algorithm_type = 'HS256'
    return token= JWT.encode({ user_id: user.id }, @hmac_secret, @algorithm_type)
    # post "/api/v1/auth/user/login", params: {email: user.email, password: user.password} , headers: {Authorization: token}
    end
  end