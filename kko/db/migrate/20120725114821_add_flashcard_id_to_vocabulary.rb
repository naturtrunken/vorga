class AddFlashcardIdToVocabulary < ActiveRecord::Migration
  def change
    add_column :vocabularies, :flashcard_id, :integer
  end
end
