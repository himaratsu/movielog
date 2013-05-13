class User < ActiveRecord::Base
  has_many :reviews
  has_many :user_movie_states, dependent: :destroy
  has_many :movies, through: :user_movie_states, source: :movie
  attr_accessible :name, :nickname, :email, :encrypt_password, :admin_flag, :icon_url, :sex, :birthday

end
