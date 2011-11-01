class CreatePlanos < ActiveRecord::Migration
  def up
    change_table :planos do |t|
      t.string :data
      t.integer :altura
      t.integer :peso


      t.timestamps
    end
  end

  def self.down
    drop_table :planos
  end
end
