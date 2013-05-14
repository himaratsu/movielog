# coding: utf-8
require 'spec_helper'

describe UserMovieStatesController do
  describe "POST register" do
    before do
      @user_movie_state = UserMovieState.new(
        :state_id => 100,
        :user_id => 100,
        :movie_id =>100,
      )
      request.env["HTTP_REFERER"] = 'http://test.host/movies/100/'
    end

    it 'redirect to :back' do
      post :register
      response.should redirect_to :back
    end
  end
end
