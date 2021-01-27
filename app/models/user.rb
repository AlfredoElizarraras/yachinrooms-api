class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :username, length: { minimum: 3,
                                 maximum: 10, }
  validates :username, uniqueness: { case_sensitive: true }
end
