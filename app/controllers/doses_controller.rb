class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def create
    @dose = Dose.new(list_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail_back = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(@cocktail_back)
  end

  private

  def list_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
