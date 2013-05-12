class SearchController < ApplicationController
  def movie
    @keyword = params[:q]
    @movies = Kaminari.paginate_array(Movie.where('title like ?', "%"+params[:q]+"%")).page(params[:page]).per(10)
  end

  def user
    @keyword = params[:q]
    @users = Kaminari.paginate_array(User.where('nickname like ?', "%"+params[:q]+"%")).page(params[:page]).per(10)
  end
end
