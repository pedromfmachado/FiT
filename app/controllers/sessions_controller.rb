class SessionsController < ApplicationController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email].downcase, params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to(root_url, :flash => {:success => "Login efectuado com sucesso!"} ) }
        format.mobile { redirect_to(new_session_path, :notice => "Login efectuado com sucesso!") }
      end
    else
      respond_to do |format|
        format.html {redirect_to(root_url, :flash => {:error => 'Email e/ou password inválidos. Tente ooutra vez'})}
        format.mobile {redirect_to(new_session_path, :notice => 'Email e/ou password inválidos. Tente outrra vezs')}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
        format.html {redirect_to(root_url, :flash => {:info => "Log out efectuado com sucesso!"} )}
        format.mobile {redirect_to(new_session_path, :notice => "Logged out!")}
    end
  end
end
