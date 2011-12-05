class DropTableGinasioNotificacao < ActiveRecord::Migration
  def up
  end

  def down
	droptable :ginasio_notificacao
  end
end
