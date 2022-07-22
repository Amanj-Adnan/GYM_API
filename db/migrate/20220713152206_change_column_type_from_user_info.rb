class ChangeColumnTypeFromUserInfo < ActiveRecord::Migration[6.1]
  def change
    change_column :user_infos, :mobile_number, :string
  end
end
