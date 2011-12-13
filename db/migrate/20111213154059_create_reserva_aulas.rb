class CreateReservaAulas < ActiveRecord::Migration
  def change
    create_table :reserva_aulas do |t|
      t.integer :aula_id
      t.integer :user_id
      t.date :dia

      t.timestamps
    end
  end
end
