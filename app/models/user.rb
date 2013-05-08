class User < ActiveRecord::Base
  attr_accessible :name, :nickname, :email, :encrypt_password, :admin_flag, :icon_url, :sex, :birthday

end
