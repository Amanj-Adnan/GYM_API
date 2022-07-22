class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :gender
      t.date :birth_date
      t.integer :mobile_number
      t.string :height
      t.string :weight
      t.timestamps
    end
  end
end
