class CocktailsController < ApplicationController

  before_action :set_cocktails, only: [:show, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(user_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def user_params
    params.require(:cocktail).permit(:name)
  end
end
