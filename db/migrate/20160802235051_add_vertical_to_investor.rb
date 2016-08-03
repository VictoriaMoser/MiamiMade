class AddVerticalToInvestor < ActiveRecord::Migration[5.0]
  def change
    add_column :investors, :vertical, :integer
    #if I want a default add ,default: 0 
  end
end
