class HomeController < ApplicationController
  def index
    # @posts = Post.all.reverse
    @posts = Post.order("id desc")
  end

  def write
    post = Post.create(email: params[:email], title: params[:title], content: params[:content])
    if post.invalid?
      @error_messages = post.errors.full_messages
    else
      post.save
      
      redirect_to '/'
    end
  end
  
  def update
    @one_post = Post.find(params[:p_id])
  end
  
  def update_post
    one_post = Post.find(params[:p_id])
    one_post.email = params[:email]
    one_post.title = params[:title]
    one_post.content = params[:content]
    one_post.save
    
    redirect_to '/'
  end
  
  def destroy
    one_post = Post.find(params[:p_id])
    one_post.destroy
    
    redirect_to '/'
  end
  
  def create_comment
    comment = Post.find(params[:p_id]).comments.create(email: params[:email], content: params[:content])
    if comment.invalid?
      @error_messages = comment.errors.full_messages
    else
      comment.save
      
      redirect_to '/'
    end
  end
  
  def destroy_comment
    Post.find(params[:p_id]).comments.find(params[:c_id]).destroy
    
    redirect_to '/'
  end
end
