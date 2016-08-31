class AddOathToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oath_token, :string
    add_column :users, :oath_token_secret, :string
  end
end
