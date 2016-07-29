class CreateStartups < ActiveRecord::Migration[5.0]
  def change
    create_table :startups do |t|
      t.string :name
      t.string :website
      t.string :address
      t.text :description
      t.date :founded_date
      t.boolean :approval

      t.timestamps
    end
  end
end
