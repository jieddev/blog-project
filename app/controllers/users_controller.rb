class UsersController < ApplicationController
  def index     
  end

  def show 
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to blog_posts_path, notice: "No User Found"
  end


  private 

    def user_params
      params.require(:user).permit(:user_id)
    end


end
