class Book < ApplicationRecord
  belongs_to :user
  has_many :loans
  belongs_to :category

  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true

 

  include PgSearch::Model

  pg_search_scope :search_by_full_name, against: [:title, :author],
    using: {
      tsearch: {
        prefix: true
      }
    }

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |book|
          csv << book.attributes.values_at(*column_names)
        end
      end
    end

    self.per_page = 12

end
