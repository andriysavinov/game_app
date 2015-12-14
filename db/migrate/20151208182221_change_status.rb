class ChangeStatus < ActiveRecord::Migration
  def self.up
   change_column :users, :status, :string
  end

  def self.down
   change_column :users, :status, :integer
  end
end