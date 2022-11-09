class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@users = User.all  
		render json: @users
	end

	def create
		@user = User.create(user_params)
		render json: @user  
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		render json: @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		render json:  {status: "deleted"}
	end


	private

	def user_params
		params.permit(:id, :first_name, :last_name, :number)
	end
end
