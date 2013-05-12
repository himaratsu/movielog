# coding: utf-8

require 'spec_helper'

describe ReviewsController do
  before do
    @review = Review.create( 
     :user_id => 1,
     :movie_id =>1,
     :rate => 1,
     :comment => 'this movie is good',
     :spoiler_flag => 1
    )
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, { :id => @review.id } 
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, { :movie_id => @review.movie_id }
      response.should be_success
    end

    it "redirects to top when no params" do
      get :new
      response.should redirect_to "/"
    end
  end
end
