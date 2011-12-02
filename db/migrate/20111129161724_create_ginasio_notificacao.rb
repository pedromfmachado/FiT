class CreateGinasioNotificacao < ActiveRecord::Migration
  def change
    create_table(:ginasio_notificacao) do |t|
      t.column :ginasio_id, :integer
      t.column :notificacao_id, :integer
    end
  end
end
