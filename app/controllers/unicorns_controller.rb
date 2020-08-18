class UnicornsController < ApplicationController

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
    params.require(:unicorn).permit(:name, :magic_power, :description, :price, :location, :photos)
  end

  def set_unicorn
    @unicorn = Unicorn.find(params[:id])
  end
end
