class AddNameAndTranslationToVocabulary < ActiveRecord::Migration
  def change
    add_column :vocabularies, :name, :string
    add_column :vocabularies, :translation, :string
  end
end
