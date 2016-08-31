class ChangeUserIdToUidInUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_id, :uid
  end
end
