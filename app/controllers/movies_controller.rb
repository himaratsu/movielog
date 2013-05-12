class MoviesController < ApplicationController
  def index
    @movies = Movie.order('id').page(params[:page]).per(10)
  end

  def sort
    @movies = Kaminari.paginate_array(Movie.get_all_data(params[:key])).page(params[:page]).per(10)
    render :action => "index"
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = Kaminari.paginate_array(Review.find(:all, :conditions => { :movie_id => params[:id] }, :order => 'updated_at desc')).page(params[:page]).per(2)
  end

  def new
    @movie = Movie.new
  end
end
