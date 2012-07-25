class AddFlashcardIdToLog < ActiveRecord::Migration
  def change
    add_column :logs, :flashcard_id, :integer
  end
end
