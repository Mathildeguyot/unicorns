class UnicornsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def show
    @unicorn = Unicorn.find(params[:id])
  end

  private

  def unicorn_params
    params.require(:article).permit(photos: [])
  end
end
