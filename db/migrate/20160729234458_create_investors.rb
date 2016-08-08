class CreateInvestors < ActiveRecord::Migration[5.0]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :address
      t.string :vertical
      t.text :description
      t.date :founded_date
      t.boolean :approval, default: false

      t.timestamps

      t.belongs_to :user, index: true
    end
  end
end
