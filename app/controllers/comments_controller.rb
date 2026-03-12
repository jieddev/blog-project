class CommentsController < ApplicationController
  before_action :set_blog_post, only: [:create]

  def new 
  end

  def create 
    @comment = @blog_post.comments.create(body: params[:body])
    @comment.user = current_user

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to blog_posts_path }
    end

  end



  
  private 

    def set_blog_post 
      @blog_post = BlogPost.find(params[:blog_post_id])
    end

    def comments_param 
      params.require(:comments).permit(:body)
    end


end
