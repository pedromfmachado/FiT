class AddAnoToPagamento < ActiveRecord::Migration
  def change
    add_column :pagamentos, :ano, :integer
  end
end
