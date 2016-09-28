class Author < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :articles
  has_many :pages
  validates :name, presence: true

  scope :active, -> { where(active: true ) }
end
