require 'rails_helper'

RSpec.describe UserSubscription, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name("User") }
  end


  describe 'validations' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:monthly_remittance) }
    it { should validate_presence_of(:user_id) }

  end
end
