class DogFactsController < ApplicationController
  def index
    @dog_facts = DogFact.includes(:author).order("date_published DESC")
  end

  def show
    @dog_fact = DogFact.find(params[:id])
  end
end
