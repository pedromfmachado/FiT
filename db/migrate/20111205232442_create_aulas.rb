class CreateAulas < ActiveRecord::Migration
  def change
    create_table :aulas do |t|
      t.references :turno
      t.references :staff
      t.references :estudio
      t.references :tipo_aula

      t.timestamps
    end
    add_index :aulas, :turno_id
    add_index :aulas, :staff_id
    add_index :aulas, :estudio_id
    add_index :aulas, :tipo_aula_id
  end
end
