class AddEmailConfirmationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_confirmation, :boolean
    add_column :users, :token_confirmation, :string
  end
end
