
class UsersController < ApplicationController
	def index
		#@users = User.search(params[:search])
		@tweets = Twitter.search(params[:search], :count => 20).statuses
	end
	
	def new
		@user = User.new
	end
	
	def show
		redirect_to signin_path unless signed_in?
		@tweets =  Twitter.search(Time.new.strftime("%T"), :count => 20).statuses
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			redirect_to @user
		else
			render 'new'
		end
	end
end
