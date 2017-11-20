class PostsController < ApplicationController
  def index
    #we want newer post to show on top so reverse the post order
    @posts = Post.all.order('created_at DESC')
  end

  def new
  end

  #save posts, define a create method
  def create
    #first create post
    @post = Post.new(post_params)
    @post.save

    #redirect to @post
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  #We need to specify what paramaters we want to save so need to create a method because rails 4 and beyond security features requries you to explcitly say what parameters you want to allow so need ap rivate method

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end


end
