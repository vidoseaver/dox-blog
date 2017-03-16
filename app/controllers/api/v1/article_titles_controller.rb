class Api::V1::ArticleTitlesController < ApplicationController
  def index
    render json: Article.all, each_serializer: Api::V1::ArticleTitlesSerializer
  end

end
