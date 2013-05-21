# coding: utf-8
class MoviesController < ApplicationController
  def index
    @movies = Movie.order('id').page(params[:page]).per(10)
  end

  def sort
    @movies = Kaminari.paginate_array(Movie.get_all_data(params[:key])).page(params[:page]).per(10)
    render :action => "index"
  end

  def show
    my_id = 1 # TODO: use session_id
    @movie = Movie.find(params[:id])
    @user_movie_state = UserMovieState.get_user_movie_state(my_id, @movie.id)
    @reviews = Kaminari.paginate_array(@movie.reviews.order('updated_at DESC')).page(params[:page]).per(10)
  end
end
