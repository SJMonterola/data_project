class CatFact < ApplicationRecord
  validates :name, :date_published, :cat_fact, presence: true
  validates :name, :cat_fact, uniqueness: true
end
