class Comicloan < ApplicationRecord
  belongs_to :comic
  #belongs_to :user
  

  has_one_attached :photo

  validates :name, presence: true
  validates :date, presence: true
end
