class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.references :user
      t.integer :mes
      t.boolean :pago

      t.timestamps
    end
    add_index :pagamentos, :user_id
  end
end
