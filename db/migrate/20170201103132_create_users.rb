class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :uid
      t.string :provider
      t.string :oauth_token

      t.timestamps null: false
    end
  end
end
