def user_login(user)
    
    
    @hmac_secret = 'kurdistan'
    @algorithm_type = "HS256"
   
    
    request.headers["Authorization"] = JWT.encode({ user_id: user.id }, @hmac_secret, @algorithm_type)
end