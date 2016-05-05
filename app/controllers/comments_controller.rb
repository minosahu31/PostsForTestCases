class CommentsController < ApplicationController

  before_action :find_post
  before_action :find_comment, only: [ :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @post
    end
  end

  def edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to @post
      else
        render "edit"
      end
  end

  def destroy
    if @comment.destroy
      redirect_to @post
    end
  end

  private

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

end
