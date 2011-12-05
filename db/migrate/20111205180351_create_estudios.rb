class CreateEstudios < ActiveRecord::Migration
  def change
    create_table :estudios do |t|
      t.string :nome
      t.integer :lotacao

      t.timestamps
    end
  end
end
