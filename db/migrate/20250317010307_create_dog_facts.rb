class CreateDogFacts < ActiveRecord::Migration[8.0]
  def change
    create_table :dog_facts do |t|
      t.string :name
      t.date :date_published
      t.string :dog_fact

      t.timestamps
    end
  end
end
