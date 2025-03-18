require "open-uri"
require 'json'

Author.destroy_all
CatFact.destroy_all
DogFact.destroy_all

# Fetching and decoding JSON resources from the fact API's using the URL
def factapi_fetch(url)
  JSON.parse(open(url).read)
end

# Cat facts URL
def catfact_url
  "https://cat-fact.herokuapp.com/facts/random?animal_type=cat&amount=1"
end

# Dog facts URL
def dogfact_url
  "https://dog-facts-api.herokuapp.com/api/v1/resources/dogs/?number=1"
end

# Variables used to represent the call of the endpoint
# Also used to specify that I only want the text part of the
# response (i.e. the actual fact itself)
catfact = factapi_fetch(catfact_url)
dogfact = factapi_fetch(dogfact_url)

# Creating 7 different records for each table
7.times do
  Author.create(
    name: Faker::Name.name,
    biography: "A #{Faker::Job.employment_type} #{Faker::Job.title} who loves to " +
    "#{Faker::Hobby} in their spare time."
  )

  CatFact.create(
    name: Author.name,
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    cat_fact: catfact['text']
  )

  DogFact.create(
    name: Author.name,
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    dog_fact: dogfact['fact']
  )
end
