class AddInicioAndDuracaoToAula < ActiveRecord::Migration
  def change

    add_column :aulas, :duracao, :integer
    add_column :aulas, :inicio, :time
    remove_column :aulas, :turno_id

  end
end
