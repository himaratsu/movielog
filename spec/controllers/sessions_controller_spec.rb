# encoding: utf-8

require 'spec_helper'

describe SessionsController do
  before do
    @user = User.create(
     :name => 'name',
     :nickname => 'nickname',
     :email => 'name@sample.com',
     :password_digest => 'password_digest',
     :icon_url => 'icon_url',
   )
  end

  describe "GET 'login'" do
    it "render sessions#new" do
      get :new
      response.should render_template("new")
    end
  end

  describe "POST 'login'" do
    it "render sessions#new" do
      post :create, { :email => @user.email,
        :password => "hoge" }
      response.should render_template("new")
    end
  end
  # ハッシュ化されたパスワードのテストがわからない…

  describe "DELETE 'logout'" do
    it "redirect top#index" do
      delete :destroy
      response.should redirect_to root_url
    end
  end

end
