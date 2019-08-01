
module Api::V1
	class UsersController < ApplicationController
	    def create
	    	@user = User.new(user_params)
			if @user.save
				auth_token = Knock::AuthToken.new payload: { sub: @user.id }
      			render json: auth_token, status: :created
			else
				render json: @user.errors, status: :unprocessable_entity
			end
	    end 

	    private

      	def user_params
			params.permit(:username, :email, :password, :password_confiramtion)
		end
	end
end  
