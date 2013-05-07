class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def sort
    @movies = Movie.get_all_data(params[:key])
    render :action => "index"
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end
end
