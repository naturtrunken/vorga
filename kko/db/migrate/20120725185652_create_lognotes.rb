class CreateLognotes < ActiveRecord::Migration
  def change
    create_table :lognotes do |t|
      t.integer :log_id
      t.integer :vocabulary_id
      t.integer :failed

      t.timestamps
    end
  end
end
