class HomeController < ApplicationController

  layout "home_layout"

  def show
    render :layout => "home_layout"
  end

end
