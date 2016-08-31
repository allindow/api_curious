class CreatePics < ActiveRecord::Migration[5.0]
  def change
    create_table :pics do |t|
      t.string :media_id
      t.string :url
      t.string :likes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
