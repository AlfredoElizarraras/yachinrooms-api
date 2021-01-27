class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :username, length: { minimum: 3,
                                 maximum: 10, }
  validates :username, uniqueness: { case_sensitive: true }

  def generate_token
    JWT.encode({ id: id,
                 exp: 2.days.from_now.to_i },
               Rails.application.secrets.secret_key_base)
  end
end
