class HomeController < ApplicationController
	before_action :authenticate_user!
	
  	def index
  		if current_user
  			@user = User.find(current_user[:id])
  			@user_number = @user.id
  		end
  	end
end
