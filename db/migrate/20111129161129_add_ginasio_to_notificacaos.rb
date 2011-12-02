class AddGinasioToNotificacaos < ActiveRecord::Migration
  def change
    add_column :notificacaos, :ginasio_id, :integer
  end
end
