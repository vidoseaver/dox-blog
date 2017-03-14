class Api::V1::ArticlesController < ApplicationController
  def index
    articles =  ArticleSorter.paginate(Article.all, 5)
    render json: articles
  end
end
