class RemoveIdFromExerciciosPlanos < ActiveRecord::Migration
  def change
  	remove_column :exercicios_planos, :id
	remove_column :exercicios_planos, :plano_id
	remove_column :exercicios_planos, :exercicio_id
	add_column :exercicios_planos, :plano_id, :integer, :primary_key => true
	add_column :exercicios_planos, :exercicio_id, :integer, :primary_key => true
  end
end
