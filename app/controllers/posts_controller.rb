class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user,       only: [:destroy, :edit, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post = @user.posts.new(post_params);
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

private
     def post_params
       params.require(:post).permit(:title, :text)
     end

     def correct_user
       @post = current_user.posts.find_by(id: params[:id])
       if @post.nil?
         flash[:alert] = "Not your post!"
         redirect_to root_path
       end
     end
end
