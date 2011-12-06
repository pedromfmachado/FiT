class AddDiaToAula < ActiveRecord::Migration
  def change
    add_column :aulas, :diaSemana, :string
  end
end
