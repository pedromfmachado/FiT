class CreateTipoAulas < ActiveRecord::Migration
  def change
    create_table :tipo_aulas do |t|
      t.string :tipo
      t.string :descricaoCurta
      t.text :descricao

      t.timestamps
    end
  end
end
