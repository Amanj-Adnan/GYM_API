require 'rails_helper'

RSpec.describe UserInfo, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name("User") }
    it { should have_many_attached(:images) }
  end


  describe 'validations' do
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:mobile_number) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:user_id) }

  end
end
