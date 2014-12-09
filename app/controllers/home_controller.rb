class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
  	if current_user
  		if !current_user.is_completed
  			redirect_to register_profile_path(current_user)
  		end


	  	gender = current_user.gender == "Male" ? "Female" : "Male"
      @all_recents = User.where(:gender=>gender).size
      @all_matches = User.where(:gender=>gender).size
	  	@recents = User.where(:gender=>gender).order('created_at DESC').limit(6)
	  	@matches = User.where(:gender=>gender).order('created_at ASC').limit(6)
	  end
  end
end
