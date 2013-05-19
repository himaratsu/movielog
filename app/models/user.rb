class User < ActiveRecord::Base
  has_many :reviews
  attr_accessible :name, :nickname, :email, :icon_url, :password_digest, :password, :password_confirmation, :admin_flag, :sex
  validates :nickname, presence: true
  has_secure_password
  validates_presence_of :password, :on => :create

end
