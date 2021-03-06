class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action :signed_in_only, only: [:edit, :create, :update, :destroy]
  
  # GET /posts/1/edit
  def edit
    @posts = current_user.posts
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to current_user
    else
      @posts = Post.all
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to current_user
    else
      @posts = Post.all
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit :text
    end
end
