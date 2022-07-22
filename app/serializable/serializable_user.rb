class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :name , :email
  
  attribute :token do 
   @token
  end

  attribute :date do
    @object.created_at
  end

  # has_many :comments do
  #   data do
  #     @object.user_info
  #   end
  # end
end
