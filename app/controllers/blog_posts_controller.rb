class BlogPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post, except: [:index, :create, :new]

  def index
    # @blog_posts = BlogPost.all  
    # @blog_posts = BlogPost.published
    @blog_posts = BlogPost.published.order_by_publish_date
    
    if params[:q].present?
      term = "%#{ActiveRecord::Base.sanitize_sql_like(params[:q].strip)}%"
      @blog_posts = @blog_posts
        .left_joins(:rich_text_content)
        .where("blog_posts.title ILIKE :term OR action_text_rich_texts.body ILIKE :term", term: term)
        .distinct
    end

    @pagy, @blog_posts = pagy(:offset, @blog_posts)
  end

  def show 
  end
  
  def new 
    @blog_post = BlogPost.new     
  end
  
  def create 
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save 
      redirect_to @blog_post
    else 
      render :new, status: :unprocessable_entity
    end
    
  end
  
  def edit 
  end
  
  def update  
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog Post update successfully"
      # flash[:sucess] = "Update successfully"
    else 
      render :edit, status: :unprocessable_entity
    end

  end
  
  def destroy     
    @blog_post.destroy 
    
    redirect_to blog_posts_path
  end
  

  private 
  
  def blog_post_params 
    params.require(:blog_post).permit(:title, :content, :published_at)
  end
  
  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
    
    rescue ActiveRecord::RecordNotFound
      redirect_to blog_posts_path
  end


end
