class ThemesController < ApplicationController
  def show
    @news = New.where('theme_id = ?', params[:id])
    @theme = Theme.find(params[:id])
  end
end
