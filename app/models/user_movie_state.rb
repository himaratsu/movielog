# coding: utf-8
class UserMovieState < ActiveRecord::Base
  attr_accessible :user_id, :movie_id, :state_id

  belongs_to :user
  belongs_to :movie

  validates :user_id, :numericality => true
  validates :movie_id, :numericality => true
  validates :state_id, :numericality => true, :inclusion => { :in => 0..3 }

  def self.get_user_movie_state(user_id, movie_id)
    @user_movie_state = self.where('user_id = ? and movie_id = ?', user_id, movie_id).first
    return @user_movie_state
  end
end
