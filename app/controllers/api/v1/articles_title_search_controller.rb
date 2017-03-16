class Api::V1::ArticlesTitleSearchController < ApplicationController
  def index
    articles = Article.find_articles_by_keyword_and_paginate(params[:search])
    render json: articles[params[:page].to_i], each_serializer: Api::V1::ArticleSerializer
  end
end
