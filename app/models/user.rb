class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :password, length: {minimum: 6}, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX}

  has_many :solutions

  has_secure_password
  def to_s
    "#{first_name} #{last_name}"
  end

  def editor?
    self.role == 'editor'
  end

  def admin?
    self.role == 'admin'
  end
end
