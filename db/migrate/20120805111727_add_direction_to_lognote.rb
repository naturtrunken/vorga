class AddDirectionToLognote < ActiveRecord::Migration
  def change
    add_column :lognotes, :direction, :integer
  end
end
