class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  belongs_to :author

  validates :title, presence: true
  validates :body, presence: true
  validate :author

  scope :published, -> { where(published: true).order('id desc') }
  scope :featured, -> { where(published: true).where(featured: true).order('id desc') }
end
