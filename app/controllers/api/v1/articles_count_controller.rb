class Api::V1::ArticlesCountController < ApplicationController
  def index
    if params[:search]
      render json: Article.where_title_or_body_includes(params[:search]).count
    else
      render json: Article.count
    end
  end
end
