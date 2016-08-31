class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :username
      t.string :full_name
      t.string :profile_picture
      t.timestamps
    end
  end
end
