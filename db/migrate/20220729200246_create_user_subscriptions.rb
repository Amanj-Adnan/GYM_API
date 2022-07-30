class CreateUserSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_subscriptions do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.integer :monthly_remittance
      t.date :start_date
      t.date :end_date
      
      t.timestamps
    end
  end
end
