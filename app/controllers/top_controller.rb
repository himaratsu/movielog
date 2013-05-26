class TopController < ApplicationController
  def index
    @movies = Movie.order('released_at').limit(5)
  end
end
