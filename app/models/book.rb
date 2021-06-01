class Book < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :loans
  

  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true



  pg_search_scope :search_by_full_name, :against => [:title, :author],
    using: {
      tsearch: {
        prefix: true
      }
    }

    self.per_page = 2

    

end
