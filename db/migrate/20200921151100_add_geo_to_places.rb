class AddGeoToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :lat, :float
    add_column :places, :lon, :float
  end
end
