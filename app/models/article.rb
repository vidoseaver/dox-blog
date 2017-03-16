class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :author
  validates :author, :title, :body, presence: true

  scope :published, -> { where(published: true).order("created_at desc") }
  scope :featured, -> { where(published: true).where(featured: true).order("id desc") }

  def self.where_title_or_body_includes(text)
    where("title  LIKE ? OR body LIKE ?", "%#{text}%", "%#{text}%")
  end

  def self.find_articles_by_keyword_and_paginate(keyword)
    articles = self.where_title_or_body_includes(keyword)
    sorted = ArticleSorter.sort_by_score_and_paginate(articles, keyword)
  end
end
