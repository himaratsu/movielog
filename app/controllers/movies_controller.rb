class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Review.find(:all, :conditions => { :movie_id => params[:id] }, :order => 'updated_at desc')
  end

  def new
    @movie = Movie.new
  end
end
