class UsersController < ApplicationController
	def index
		@users=User.all
	end

	def show
		@user=User.find(params[:id])
		@posts1 = @user.posts
	end


	def edit
		
	end

	def update
	end

	private
     def user_params
       params.require(:user).permit(:email,:name,:profile)
     end
     def find_user
     	@user = User.find_by_email(params[:email])
     end
end
