class AddLatitudeLongitudeToCidade < ActiveRecord::Migration
  def change
    add_column :cidades, :latitude, :float
    add_column :cidades, :longitude, :float
  end
end
