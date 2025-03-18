class CatFact < ApplicationRecord
  belongs_to :author
  # validates that the name,date, and fact are not empty
  validates :name, :date_published, :cat_fact, presence: true
  # validates that the name and fact are unique
  validates :name, :cat_fact, uniqueness: true
end
