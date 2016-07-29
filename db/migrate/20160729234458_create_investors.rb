class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :address
      t.text :description
      t.date :founded_date
      t.boolean :approval

      t.timestamps
    end
  end
end
