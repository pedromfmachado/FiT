class CreateAlimentarPlanos < ActiveRecord::Migration
  def change
    create_table :alimentar_planos do |t|
      t.date :data
      t.text :pequenoalmoco
      t.text :manha
      t.text :almoco
      t.text :tarde
      t.text :jantar
      t.text :ceia

      t.timestamps
    end
  end
end
