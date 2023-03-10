class User < ApplicationRecord
  has_many :bookings
  has_many :shoes, through: :bookings
  has_many :shoes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
