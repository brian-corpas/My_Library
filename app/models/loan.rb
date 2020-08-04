class Loan < ApplicationRecord
  belongs_to :book

  has_one_attached :photo

  validates :name, presence: true
  validates :date, presence: true
end
