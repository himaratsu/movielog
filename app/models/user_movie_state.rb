class UserMovieState < ActiveRecord::Base
  attr_accessible :user_id, :movie_id, :state_id
end
