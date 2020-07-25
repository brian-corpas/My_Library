class Book < ApplicationRecord
  belongs_to :users
  has_many :loans
  has_many :users, through: :loans
end
