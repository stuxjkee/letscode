class User < ActiveRecord::Base
  has_and_belongs_to_many :courses
  validates :password, length: {minimum: 6}

  has_secure_password
  def to_s
    "#{first_name} #{last_name}"
  end
end
