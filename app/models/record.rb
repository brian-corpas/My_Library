class Record < ApplicationRecord
  belongs_to :user


  has_one_attached :photo

  validates :title, presence: true
  validates :author, presence: true
  
end
