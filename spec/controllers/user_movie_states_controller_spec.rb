require 'spec_helper'

describe UserMovieStatesController do
  describe "POST create" do
    it 'returns http redirect' do
      post :create
      response.should redirect_to :back
    end
  end
end
