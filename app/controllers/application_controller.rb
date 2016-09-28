class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def load_article
    @article = Article.friendly.find(params[:id])
  end

  def load_page
    @page = Page.friendly.find(params[:id])
  end
end
