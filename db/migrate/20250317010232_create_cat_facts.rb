class CreateCatFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :cat_facts do |t|
      t.string :name
      t.date :date_published
      t.string :cat_fact

      t.timestamps
    end
  end
end
