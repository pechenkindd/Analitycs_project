class NewsController < ApplicationController
  def show
    @new = New.find(params[:id])
  end

  def show_comments
    @comments = Comment.all
  end

  def new_comment
    
  end
end
