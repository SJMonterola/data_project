class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # For the search bar
  # @query = params[:query]
  # @authors = Author.where("name LIKE ?", "%#{@query}")
  # @cat_facts = CatFact.where("name LIKE ?", "%#{@query}")
  # @dog_facts = DogFact.where("name LIKE ?", "%#{@query}")
end
