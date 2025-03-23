class HomeController < ApplicationController
  def index
    # For displaying the random facts on start up
    @cat_fact = CatFact.find(CatFact.ids.sample)
    @dog_fact = DogFact.find(DogFact.ids.sample)
  end
end
