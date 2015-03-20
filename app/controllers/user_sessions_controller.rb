class UserSessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password]) # We get the method authenticate 'for free' when we declare in the model that has_secure password
  		session[:user_id] = user.id
  		flash[:success] = "Thanks for logging in!"
  		redirect_to todo_lists_path
  	else
  		flash[:error] = "There was a problem logging in. Please check your login details."
  		render action: 'new'
  	end
  end
end
