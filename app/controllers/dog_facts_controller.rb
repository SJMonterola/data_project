class DogFactsController < ApplicationController
  def index
    @dog_facts = DogFact.includes(:author).order("date_published DESC").page(params[:page])
  end

  def show
    @dog_fact = DogFact.find(params[:id])
  end
end
