class AddShortdescriptionLatitudeLongitudToStartups < ActiveRecord::Migration[5.0]
  def change
    add_column :startups, :shortdescription, :string
    add_column :startups, :latitude, :float
    add_column :startups, :longitude, :float
  end
end
