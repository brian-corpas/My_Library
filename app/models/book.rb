class Book < ApplicationRecord
 
  belongs_to :user
  has_many :loans
  

  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |book|
        csv << book.attributes.values_at(*column_names)
      end
    end
  end


end
