require 'spec_helper'

describe UsersController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
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
    it "returns http success" do
      get :show, { :id => @user.id }
      response.should be_success
    end
  end

  describe "GET 'follow'" do
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
    it "returns http success" do
      get :index, { :id => @user.id }
      response.should be_success
    end
  end

  describe "GET 'unfollow'" do
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
    it "returns http success" do
      get :index, {:id => @user.id }
      response.should be_success
    end 
  end
end
