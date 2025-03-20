class CatFactsController < ApplicationController
  def index
    @cat_facts = CatFact.order("date_published DESC")
  end

  def show
    @cat_fact = CatFact.find(params[:id])
  end
end
