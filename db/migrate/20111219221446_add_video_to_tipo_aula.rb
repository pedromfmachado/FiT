class AddVideoToTipoAula < ActiveRecord::Migration
  def change
    add_column :tipo_aulas, :video_id, :string
  end
end
