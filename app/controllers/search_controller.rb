class SearchController < ApplicationController
  def movie
    @keyword = params[:q]
    @movies = Movie.where('title like ?', "%"+params[:q]+"%").all
  end

  def user
    @keyword = params[:q]
    @users = User.where('nickname like ?', "%"+params[:q]+"%").all
  end
end
