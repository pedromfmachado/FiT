class CreateExercicios < ActiveRecord::Migration
  def self.up
    create_table :exercicios do |t|
      t.string :nome
      t.string :maquina
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :exercicios
  end
end
