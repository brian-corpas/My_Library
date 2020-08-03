class Loan < ApplicationRecord
  belongs_to :book

  validates :name, presence: true
  validates :date, presence: true
end
