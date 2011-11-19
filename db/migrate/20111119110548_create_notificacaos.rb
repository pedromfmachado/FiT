class CreateNotificacaos < ActiveRecord::Migration
  def change
    create_table :notificacaos do |t|
      t.date :data
      t.string :titulo
      t.text :texto
      t.references :admin

      t.timestamps
    end
  end
end
