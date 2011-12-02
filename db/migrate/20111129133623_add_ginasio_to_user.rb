class AddGinasioToUser < ActiveRecord::Migration
  def change
    add_column :users, :ginasio_id, :integer
  end
end
