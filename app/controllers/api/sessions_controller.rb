class Api::SessionsController < ApiController

	require 'builder'

	def new
		User.new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id

			@xml = Builder::XmlMarkup.new( :indent => 2 )
			@xml.instruct! :xml
			@xml.session do |x|
				x.token user.token
			end
			render :xml => @xml
		else
			render :xml => { :error => 'User not autenticated' }, :status =>  149
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

	skip_before_filter :verify_authenticity_token
end
