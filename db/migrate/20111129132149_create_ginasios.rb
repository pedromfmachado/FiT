class CreateGinasios < ActiveRecord::Migration
  def change
    create_table :ginasios do |t|
      t.string :nome
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
