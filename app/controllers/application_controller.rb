class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success

  # After adding the following two methods, everything starts to fail badly if you bin/rake.
  # This is because most of the tests written up to now don't take into account the fact that
  # now the user has to be authenticated to do any of the operations required in the tests.
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
  	if current_user
  		true
  	else
  		redirect_to new_user_session_path, notice: "You must be logged in to access that page."
  	end
  end
end
