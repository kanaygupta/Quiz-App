class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password

  validates :password, presence: true, length: { minimum: 3 }, allow_nil: true
  has_many :lecategories, dependent: :destroy
  has_many :lesubcategories, dependent: :destroy
  has_many :lequizs, dependent: :destroy
  has_many :states,dependent: :destroy
  has_many :scores,dependent: :destroy
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end