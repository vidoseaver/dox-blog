class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :author
  validates :author, :title, :body, presence: true

  scope :published, -> { where(published: true).order("created_at desc") }
  scope :featured, -> { where(published: true).where(featured: true).order("id desc") }

  def self.where_title_or_body_includes(text)
    where("title OR body LIKE ?", "%#{text}%")
  end

end
