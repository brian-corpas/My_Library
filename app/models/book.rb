class Book < ApplicationRecord
 
  belongs_to :user
  has_many :loans
  

  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_full_name, against: [:title, :author]

end
