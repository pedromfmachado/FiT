class RemoveDescricaoCurtaFromTipoAula < ActiveRecord::Migration
  def change
    remove_column :tipo_aulas, :descricaoCurta
  end
end
