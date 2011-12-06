class CreateTurnos < ActiveRecord::Migration
  def change
    create_table :turnos do |t|
      t.time :hora

      t.timestamps
    end
  end
end
