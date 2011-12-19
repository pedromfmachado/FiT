class SessionsController < ApplicationController


  def new
    User.new
  end

  def create
    user = User.authenticate(params[:email].downcase, params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to(notificacaos_path, :flash => { :success => "Login efectuado com sucesso!"} ) }
        format.mobile { redirect_to(new_session_path, :flash => { :success => "Login efectuado com sucesso!"} ) }
      end
    else
      respond_to do |format|
        format.html {redirect_to(root_url, :flash => {:error => 'Email e/ou password invalidos. Tente outra vez'})}
        format.mobile {redirect_to(new_session_path, :flash => {:error => 'Email e/ou password invalidos. Tente outra vez'})}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
        format.html {redirect_to(root_url, :flash => { :info => "Log out efectuado com sucesso."} )}
        format.mobile {redirect_to(new_session_path, :flash => {:info => "Log out efectuado com sucesso."})}
    end
  end
end
