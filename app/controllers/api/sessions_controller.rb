class Api::SessionsController < ApiController

	require 'builder'

	def new
		User.new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:token] = user.token

			render :xml => session
		else
			render :xml => { :error => 'User not autenticated' }, :status =>  149
		end
	end

	skip_before_filter :verify_authenticity_token
end
