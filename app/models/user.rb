class User < ApplicationRecord
    has_secure_password
    has_one :user_info ,dependent: :destroy
    has_many :user_subscription , dependent: :destroy
    validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 6..40}
    validates :email , presence: true ,  uniqueness: true
    validates_associated :user_info
    # enum status: {active: 1 , inactive: 0 }
    # sidekiq cronjob
    # shouldamatchers
    # faker gem
    # factoryBot
    # gem 'idempotent-request'
    #  rswag
    # gem 'has_scope'

    scope :without_user_profiles, -> { where('NOT EXISTS(SELECT 1 FROM user_infos WHERE user_id = users.id)') }

end
