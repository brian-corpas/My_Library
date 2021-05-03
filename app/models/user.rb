class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  
  has_many :books
  has_many :comics
  has_many :wishlists
  has_many :loans, through: :books
  has_many :comicloans, through: :comics
  has_one_attached :photo

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

end
