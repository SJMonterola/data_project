require 'net/http'
require 'json'

CatFact.destroy_all
DogFact.destroy_all
Author.destroy_all

# Fetching and decoding JSON resources from the fact API's using the URL
def factapi_fetch(url)
  uri = URI(url)
  https = Net::HTTP.new(uri.host, uri.port)
  https.use_ssl = true
  request = Net::HTTP::Get.new(uri)
  response = https.request(request)
  JSON.parse(response.read_body) # Convert JSON data into Ruby data.
end

# Cat facts URL
def catfact_url
  "https://meowfacts.herokuapp.com/?count=60"
end

# Dog facts URL
def dogfact_url
  "https://dogapi.dog/api/v2/facts?limit=1"
end

# Variables used to represent the call of the endpoint
# Also used to specify that I only want the text part of the
# response (i.e. the actual fact itself)
catfact = factapi_fetch(catfact_url())


# Creating different records for each table
# Range used for the data arrays from the APIs
data_facts = 0..59

# Issues to resolve
# Find a way to iterate through the author IDs
# Solve the dog fact API indexes

data_facts.each do |data_fact|
  dogfact = factapi_fetch(dogfact_url())
  author = Author.create(
    name: Faker::Name.name,
    biography: "A #{Faker::Job.employment_type.downcase} #{Faker::Job.title.downcase} who loves " +
    "#{Faker::Hobby.activity.downcase} in their spare time."
  )

  CatFact.create!(
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    cat_fact: catfact["data"][data_fact],
    author: author
  )

  DogFact.create(
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    dog_fact: dogfact["data"][0]["attributes"]["body"],
    author: author
  )
end
