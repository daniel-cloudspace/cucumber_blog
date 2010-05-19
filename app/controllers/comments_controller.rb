class CommentsController < ApplicationController
  def create
    #debugger
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    redirect_to @post
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(@post) }
      format.xml  { head :ok }
    end
  end

end
