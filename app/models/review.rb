# coding: utf-8
class Review < ActiveRecord::Base
  attr_accessible :user_id, :movie_id, :rate, :comment, :spoiler_flag

  belongs_to :user
  belongs_to :movie

  validates :user_id,      :numericality => true
  validates :movie_id,     :numericality => true
  validates :rate,         :inclusion => { :in => 0..5 }
  validates :comment,      :length =>  { :minimum => 5, :maximum => 64 }
  validates :spoiler_flag, :inclusion => { :in => 0..1}

end
