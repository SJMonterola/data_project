class CreateCatFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_facts do |t|
      t.string :cat_fact
      t.date :date_published
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
