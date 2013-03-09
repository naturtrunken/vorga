class AddDirectionToLog < ActiveRecord::Migration
  def change
    add_column :logs, :direction, :integer
  end
end
