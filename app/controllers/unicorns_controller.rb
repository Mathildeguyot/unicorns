class UnicornsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

  def index
    @unicorns = Unicorn.all
  end

  def show
    @unicorn = Unicorn.find(params[:id])
  end

  def new
    @unicorn = Unicorn.new
  end

  def create
    @unicorn = Unicorn.new(params_unicorn)
    if @unicorn.save
      redirect_to unicorn_path(@unicorn)
    else
      render :new
    end
  end

  def params_unicorn
    params.require(:unicorn).permit(:name, :magic_power, :description, :price, :location, :photos [])
  end

  def set_unicorn
    @unicorn = Unicorn.find(params[:id])
  end
end
