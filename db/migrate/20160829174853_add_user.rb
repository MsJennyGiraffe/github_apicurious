class AddUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :oauth_token
      t.string :oauth_token_secret
      t.string :avatar
      t.integer :uid
      t.timestamps
    end
  end
end
