class Topic < ActiveRecord::Base
  belongs_to :course
  has_one :task
end
