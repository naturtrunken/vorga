class AddLanguageIdToFlashcard < ActiveRecord::Migration
  def change
    add_column :flashcards, :language_id, :integer

  end
end
