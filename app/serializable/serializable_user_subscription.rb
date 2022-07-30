class SerializableUserSubscription < JSONAPI::Serializable::Resource
  type 'user_subscriptions'
  attribute :user_id
  attribute :monthly_remittance
  attribute :start_date
  attribute :end_date
  attribute :created_at
  attribute :updated_at
end
