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

      t.belongs_to :user, index: true

    end
  end
end
