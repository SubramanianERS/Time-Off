class User < ApplicationRecord
  before_save { email.downcase! }
  before_save { employee_id.upcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  validates :employee_id, presence: true, length: { minimum: 5 }, uniqueness: true
  has_secure_password
end
