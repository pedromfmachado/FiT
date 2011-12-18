class AddUserIdToAlimentarPlano < ActiveRecord::Migration
  def change
    add_column :alimentar_planos, :user_id, :integer
  end
end
