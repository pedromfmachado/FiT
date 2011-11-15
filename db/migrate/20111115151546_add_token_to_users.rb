class AddTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :token, :string, :limite => 36
  end

  def self.down
    remove_column :users, :token
  end
end
