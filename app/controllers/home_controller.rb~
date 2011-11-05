class HomeController < ApplicationController

  layout "home_layout"

  def show
    respond_to do |format|
      format.html {render :layout => "home_layout"}
      format.mobile {redirect_to new_session_path }
    end
  end

end
