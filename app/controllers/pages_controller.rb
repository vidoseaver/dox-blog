class PagesController < ApplicationController
  before_action :load_page, only: :show

  def index
    @featured_page = Page.featured.limit(1).first
    @pages = Page.published.where.not(id: @featured_page).
      paginate(page: params[:page])
  end

  def show
  end
end
