class CommentsController < ApplicationController




  
  private 

    def set_blog_post 
      @blog_post = BlogPost.find(params[:blog_post_id])
    end

end
