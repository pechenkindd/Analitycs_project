class NewsController < ApplicationController
  before_action :set_user_id, only: [:create_comment]

  def show
    @new = New.find(params[:id])
    session[:new_id] = @new.id
  end

  def show_comments
    @comments = Comment.where(new_id: session[:new_id])
  end

  def new_comment; end

  def create_comment
    @comment = Comment.new(user_email: current_user.email, body: params[:comment_body], new_id: session[:new_id], user_id: @user_id)
    
    @comment.save if @comment.valid?
    redirect_to "/themes/news/#{@new_id}", notice: "Success" if @comment.valid?
  end

  private

  def set_user_id
    user = User.find_by(email: current_user.email)
    @user_id = user.id
  end

end
