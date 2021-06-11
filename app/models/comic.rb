class Comic < ApplicationRecord
  belongs_to :user
  has_many :comicloans
 

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

    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |comic|
          csv << comic.attributes.values_at(*column_names)
        end
      end
    end

    self.per_page = 2

end
