#encoding: utf-8

class SearchController < ApplicationController
  def movie
    @keyword = params[:movie_q]
    @movies = Kaminari.paginate_array(Movie.where('title like ?', "%"+params[:movie_q]+"%")).page(params[:page]).per(10)
  end

  def user
    @keyword = params[:user_q]
    @users = Kaminari.paginate_array(User.where('nickname like ?', "%"+params[:user_q]+"%")).page(params[:page]).per(10)
  end
end
