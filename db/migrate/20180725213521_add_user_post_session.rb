class AddUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
    create_table :posts do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
    create_table :sessions do |t|
      t.string :access_token
      t.string :refresh_token
      t.integer :user_id
      t.boolean :access_token_redeem
      t.boolean :refresh_token_redeemed
      t.datetime :expires_on

      t.timestamps
    end
  end
end
