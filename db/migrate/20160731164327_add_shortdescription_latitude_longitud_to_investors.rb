class AddShortdescriptionLatitudeLongitudToInvestors < ActiveRecord::Migration[5.0]
  def change
    add_column :investors, :shortdescription, :string
    add_column :investors, :latitude, :float
    add_column :investors, :longitude, :float
  end
end
