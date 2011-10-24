class CreateExerciciosPlanos < ActiveRecord::Migration
  def self.up
    create_table :exercicios_planos do |t|
      t.references :plano
      t.references :exercicio
      t.integer :peso
      t.integer :series
      t.integer :repeticoes

      t.timestamps
    end
  end

  def self.down
    drop_table :exercicios_planos
  end
end
