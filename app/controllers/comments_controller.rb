class CommentsController < ApplicationController
  before_action :set_blog_post, only: [:create]

  def new 
  end

  def create 
    @comment = @blog_post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save   
      # respond_to do |format|
      #   format.turbo_stream
      #   format.html { redirect_to blog_posts_path, notice: "Comment posted successfully"}
      # end
      redirect_to blog_posts_path
    else 
      respond_to do |format|
        format.html { redirect_to blog_posts_path }
      end

    end

  end



  
  private 

    def set_blog_post 
      @blog_post = BlogPost.find(params[:blog_post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end


end
