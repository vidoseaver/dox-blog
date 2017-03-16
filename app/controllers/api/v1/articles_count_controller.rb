class Api::V1::ArticlesCountController < ApplicationController
  def index
    if params[:search]
      articles = ArticleSorter.paginate(Article.where_title_or_body_includes(params[:search]), 5)
      render json: articles.count
    else
      render json: ArticleSorter.paginate(Article.all, 5).count
    end
  end
end
