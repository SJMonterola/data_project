class CatFactsController < ApplicationController
  def index
    @cat_facts = CatFact.includes(:author).order("date_published DESC").page(params[:page])
  end

  def show
    @cat_fact = CatFact.find(params[:id])
  end
end
