class HomeController < ApplicationController
  def index
    # For displaying the random facts on start up
    @cat_fact = CatFact.find(CatFact.ids.sample)
    @dog_fact = DogFact.find(DogFact.ids.sample)
    # For the search bar (cannot decide whether it goes in here or in app controller)
    # @query = params[:query]
    # @authors = Author.where("name LIKE ?", "%#{@query}")
    # @cat_facts = CatFact.where("name LIKE ?", "%#{@query}")
    # @dog_facts = DogFact.where("name LIKE ?", "%#{@query}")
  end
end
