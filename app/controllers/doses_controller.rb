class DosesController < ApplicationController
  # def show
  #   @cocktail = Cocktail.find(params[:id])
  # end

  def new
    @cocktail = Cocktail.new
  end

  def create
   @dose = Dose.new(dose_params)
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose.cocktail = @cocktail
   @dose.save
   redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(dose_params)
    @dose.cocktail = cocktail
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def set_cocktail
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient, :cocktail)
  end
end
