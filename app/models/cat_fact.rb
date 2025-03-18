class CatFact < ApplicationRecord
  belongs_to :author
  # validates that the name,date, and fact are not empty
  validates :cat_fact, :date_published, presence: true
  # validates that the name and fact are unique
  validates :cat_fact, uniqueness: true
end
