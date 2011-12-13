class AddDiaSemanaToAula < ActiveRecord::Migration
  def change
	remove_column :aulas, :diaSemana
	add_column :aulas, :diaSemana, :integer
  end
end
