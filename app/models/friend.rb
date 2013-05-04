class Friend < ActiveRecord::Base
  attr_accessible :following_id, :followed_id
  validates_presence_of :following_id, :followed_id
end
