class SerializableUserInfo < JSONAPI::Serializable::Resource
  type 'user_infos'
  attribute :user_id
  attribute :gender
  attribute :birth_date
  attribute :mobile_number
  attribute :height
  attribute :weight
  attribute :created_at
  attribute :updated_at
  has_many :images_attachments
  has_many :images_blobs
end
