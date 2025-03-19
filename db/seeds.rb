require 'net/http'
require 'json'

Author.destroy_all
CatFact.destroy_all
DogFact.destroy_all

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
  "https://meowfacts.herokuapp.com/?count=1"
end

# Dog facts URL
def dogfact_url
  "https://dogapi.dog/api/v2/facts?limit=1"
end

# Variables used to represent the call of the endpoint
# Also used to specify that I only want the text part of the
# response (i.e. the actual fact itself)
catfact = factapi_fetch(catfact_url())
dogfact = factapi_fetch(dogfact_url())

# Creating 30 different records for each table
30.times do
  Author.create(
    name: Faker::Name.name,
    biography: "A #{Faker::Job.employment_type} #{Faker::Job.title} who loves to " +
    "#{Faker::Hobby} in their spare time."
  )

  # May remove the name columns because they are references to author, but not actual columns themselves
  CatFact.create(
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    cat_fact: catfact["data"][0]
  )

  DogFact.create(
    date_published: Faker::Date.on_day_of_week_between(day: [ :monday, :tuesday, :wednesday, :thursday, :friday,
    :saturday, :sunday ], from: '2000-01-01', to: '2026-01-01'),
    dog_fact: dogfact["data"][0]["attributes"]["body"]
  )
end
