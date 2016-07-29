class AddEmailToStartup < ActiveRecord::Migration[5.0]
  def change
    add_column :startups, :email, :string
  end
end
