class Comic < ApplicationRecord
  belongs_to :user
  has_many :loans

  has_one_attached :photo

  validates :title, presence: true
  validates :colection, presence: true


  include PgSearch::Model

  pg_search_scope :search_by_full_name, against: [:title, :colection],
    using: {
      tsearch: {
        prefix: true
      }
    }
end
