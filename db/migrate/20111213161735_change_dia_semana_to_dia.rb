class ChangeDiaSemanaToDia < ActiveRecord::Migration
  def change
	remove_column :aulas, :diaSemana
	add_column :aulas, :dia, :integer
  end
end
