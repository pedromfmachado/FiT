class AddGinasioIdToAula < ActiveRecord::Migration
  def change
    add_column :aulas, :ginasio_id, :integer
  end
end
