class MatchesController < ApplicationController

before_filter :authenticate_user!

  def index
  	gender = current_user.gender == "Male" ? "Female" : "Male"
  	@matches = User.where(:gender=>gender)
  end
end
