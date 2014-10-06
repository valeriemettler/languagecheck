class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
