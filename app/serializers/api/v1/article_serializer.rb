class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :author, :time, :title, :body, :image_path, :slug

  def author
    object.author.name
  end

  def time
    object.created_at.strftime("%b %d, %Y")
  end

  def image_path
    path = ActionController::Base.helpers.asset_path("heroes/" + object.hero_image_name) unless object.hero_image_name == nil
    path
  end
end
