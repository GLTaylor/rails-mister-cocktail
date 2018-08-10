class DosesController < ApplicationController
  # before_action :set_cocktail
  def new
   set_cocktail
    @dose = Dose.new
  end

  def create
    set_cocktail
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
