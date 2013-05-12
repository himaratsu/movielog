class Review < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :movie_id, :rate, :comment, :spoiler_flag

  validates :user_id,      :numericality => true
  validates :movie_id,     :numericality => true
  validates :rate,         :inclusion => { :in => 0..5 }
  validates :comment,      :length =>  { :minimum => 5, :maximum => 64 }
  validates :spoiler_flag, :inclusion => { :in => 0..1}

end
