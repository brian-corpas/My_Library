class Book < ApplicationRecord
 
  belongs_to :user
  has_many :loans
  

  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true


end
