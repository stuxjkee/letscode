class Task < ActiveRecord::Base
  belongs_to :topic
  has_many :solutions
  has_many :tests
end
