class PostsController < ApplicationController
  def index
    #we want newer post to show on top so reverse the post order
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  #save posts, define a create method
  def create
    #first create post
    @post = Post.new(post_params)

    # if statement to control when to display error messages and to handle if save is successful
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to @post
    else
      #we want to do a render instead of a redirect because a redirect will do a new http refresh if the post did not save and the user will loose all the content they put in the form.  Render new method keeps all content in place
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
  if @post.update(params[:post].permit(:title, :body))
    flash[:notice] = "Post successfully updated"
    redirect_to @post
  else
    render 'edit'
  end
end


def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to root_path
end





  #We need to specify what paramaters we want to save so need to create a method because rails 4 and beyond security features requries you to explcitly say what parameters you want to allow so need a private method
  private
    def post_params
      params.require(:post).permit(:title, :body)
    end


end
