class AddLanguageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :language_id, :integer
    add_index :questions, :language_id
  end
end
