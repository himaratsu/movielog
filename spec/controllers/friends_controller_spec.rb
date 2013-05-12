require 'spec_helper'

describe FriendsController do
  before do
    @user = User.create(
     :name => 'name',
     :nickname => 'nickname',
     :email => 'name@sample.com',
     :encrypt_password => 'encrypt_password',
     :admin_flag => 0,
     :icon_url => 'icon_url',
     :sex => 1,
   )
  end

  describe "GET 'follow'" do
    it "redirect users#show" do
      get :follow, { :id => @user.id }
      response.should redirect_to(:controller=>'users', :action=>'show') 
    end
  end

  describe "GET 'unfollow'" do
    it "redirect users#show" do
      get :unfollow, { :id => @user.id }
      response.should redirect_to(:controller=>'users', :action=>'show')
    end
  end

end
