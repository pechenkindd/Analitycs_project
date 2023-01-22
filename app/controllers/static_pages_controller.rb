class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
    @themes = Theme.all
  end

  def dashboard
  end
end
