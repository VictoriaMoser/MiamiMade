class AddEmailConfirmationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_confirmation, :boolean, :default => false 
    add_column :users, :token_confirmation, :string
  end
end
