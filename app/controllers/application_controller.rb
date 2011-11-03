class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html {redirect_to( root_url, :alert => exception.message) }
      format.xml  { render :xml => { :error => 'ok' }, :status =>  422 }
    end
  end
  
end
