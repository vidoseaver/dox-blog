class Api::V1::ArticlesTitleSearchController < ApplicationController
  def index
    render json: Article.find_articles_by_keyword_and_paginate(params[:search])
  end
end
