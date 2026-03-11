class LikesController < ApplicationController
  before_action :set_blog_post

  def create 
    @blog_post.likes.create(user: current_user)
    
    respond_to do |format|
      format.turbo_stream
      format.html {redirect_to @blog_post}
    end
    
  end

  def destroy 
    @like = @blog_post.likes.find_by(user: current_user)
    @like.destroy if @like 
    
    respond_to do |format|
      format.turbo_stream
      format.html {redirect_to @blog_post}
    end
  end

  private 

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  
  end


end
