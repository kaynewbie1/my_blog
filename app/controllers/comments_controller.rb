class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(comment_params)
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  # private def comment_params
  #   params.require(:comment).permit(:name, :body)
  # end

end
