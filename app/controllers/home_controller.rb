class HomeController < ApplicationController
  def index
    @cat_fact = CatFact.find(CatFact.ids.sample)
    @dog_fact = DogFact.find(DogFact.ids.sample)
  end
end
