class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
