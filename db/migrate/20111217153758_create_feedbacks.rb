class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :aula
      t.integer :valor

      t.timestamps
    end
    add_index :feedbacks, :aula_id
  end
end
