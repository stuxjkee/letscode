class Course < ActiveRecord::Base
  has_many :topics, dependent: :destroy

  has_and_belongs_to_many :users
end
