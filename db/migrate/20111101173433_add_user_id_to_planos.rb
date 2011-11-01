class AddUserIdToPlanos < ActiveRecord::Migration
  def self.up
    add_column :planos, :data, :date
  end

  def self.down
    remove_column :planos, :data
  end
end
