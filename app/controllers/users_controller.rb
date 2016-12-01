class UsersController < ApplicationController
	def logout
		sign_out(current_user)
		redirect_to '/'
	end
end
