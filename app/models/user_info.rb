class UserInfo < ApplicationRecord
    has_many_attached :images
    belongs_to :user, class_name: "User", foreign_key: "user_id"

    validates :birth_date,:weight,:height,:mobile_number,:gender , presence: true
    validates :user_id, presence: true, uniqueness: true
     
    
end
