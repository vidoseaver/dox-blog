class Api::V1::ArticlesController < ApplicationController
  def index
    articles = ArticleSorter.paginate(Article.all, 5)
    render json: articles[params[:page].to_i], each_serializer: Api::V1::ArticleSerializer
  end
end
