class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :update]

  def index
    @cocktails = Cocktail.all.sort_by { |cocktail| cocktail.votes }.reverse
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

  def update
    @cocktail.votes += 1
    @cocktail.save
    redirect_to cocktails_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def list_params
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end
end

