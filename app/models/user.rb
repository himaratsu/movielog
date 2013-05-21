class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :email, :icon_url, :password_digest, :password, :password_confirmation, :admin_flag, :sex

  has_many :reviews
  has_many :user_movie_states, dependent: :destroy
  has_many :movies, through: :user_movie_states, source: :movie

  validates :nickname, presence: true
  validates_presence_of :password, :on => :create

  has_secure_password

end
