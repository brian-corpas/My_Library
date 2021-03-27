class Comic < ApplicationRecord
  belongs_to :user
  has_many :loans

  has_one_attached :photo

  validates :title, presence: true
  validates :colection, presence: true


  include PgSearch::Model

  multisearchable against: [:title, :colection]
end
