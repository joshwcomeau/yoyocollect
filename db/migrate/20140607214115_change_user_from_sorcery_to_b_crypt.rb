class ChangeUserFromSorceryToBCrypt < ActiveRecord::Migration
  def change
  	remove_column :users, :crypted_password
  	remove_column :users, :salt
  	remove_column :users, :remember_me_token
  	remove_column :users, :remember_me_token_expires_at
  	remove_column :users, :reset_password_token
  	remove_column :users, :reset_password_token_expires_at
  	remove_column :users, :reset_password_email_sent_at

  	add_column :users, :password_hash, :string
  end
end
