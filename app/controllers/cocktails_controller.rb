class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(list_params)

    if @cocktail.save
      redirect_to @cocktail
    else
      rended :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def list_params
    params.require(:cocktail).permit(:name)
  end
end

