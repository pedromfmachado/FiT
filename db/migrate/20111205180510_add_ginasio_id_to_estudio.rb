class AddGinasioIdToEstudio < ActiveRecord::Migration
  def change
    add_column :estudios, :ginasio_id, :integer
  end
end
