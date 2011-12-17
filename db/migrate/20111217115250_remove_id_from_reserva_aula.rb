class RemoveIdFromReservaAula < ActiveRecord::Migration
  def change

	remove_column :reserva_aulas, :id

  end
end
