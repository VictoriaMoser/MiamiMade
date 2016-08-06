class AddApprovalToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :approval, :boolean, :default => false
  end
end
