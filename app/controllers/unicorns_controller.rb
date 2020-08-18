class UnicornsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @unicorn = Unicorn.find(params[:id])
  end

  def unicorn_params
    params.require(:unicorn).permit(:name, :magic_power, :rating, :description, :location, :price, :user)
  end
end
