module Api 
  module V1 
    class BlogPostsController < ApplicationController
      def index 
        @blog_posts = BlogPost.published.order_by_publish_date
        
        render json: @blog_posts
      end

      def show 
        render json: @blog_post
      end

      private 
      

      def set_blog_post
        @blog_post = BlogPost.find(params[:id])
        
        rescue ActiveRecord::RecordNotFound
          render json: { error: "Not found"  }, status: :not_found
      end

      
    end
  end
end