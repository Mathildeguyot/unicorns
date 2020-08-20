class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @my_unicorns = Unicorn.where(user: current_user)
  end
end
