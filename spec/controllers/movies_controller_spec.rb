require 'spec_helper'

describe MoviesController do
  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    before do
      @movie = Movie.create(
        :title => 'title',
        :description => 'description',
        :category_id => 1,
        :image_url => 'image_url',
        :image_num => 1,
        :thumbnail_url => 'thumbnail_url',
      )
    end
    it "returns http success" do
      get :show , { :id => @movie.id }
      response.should be_success
    end
  end
end
