class CommentsController < ApplicationController
  before_action :current_user

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(user_id: current_user.id, text: commnet_params[:text])
    if @comments.save
      flash[:notice] = 'Comment added succesfully'
    else
      flash[:alert] = 'Add Comment failed'
    end
    redirect_to user_post_path(current_user, @post)
  end

  # private

  def commnet_params
    params.require(:comment).permit(:text)
  end
end
