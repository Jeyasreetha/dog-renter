class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # if there is no user(owner and renter) destroy the dog
  has_many :dogs, dependent: :destroy
  has_many :rentings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
