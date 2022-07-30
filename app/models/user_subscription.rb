class UserSubscription < ApplicationRecord
    belongs_to :user

    validates :start_date,:end_date,:monthly_remittance,:user_id, presence: true
end
