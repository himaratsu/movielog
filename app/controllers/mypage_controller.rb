class MypageController < ApplicationController
  def index
    @my_id = 1
    @my_info = User.find_by_id(@my_id)
    @following_count = Friend.num_of_following(@my_id)
    @followed_count = Friend.num_of_followed(@my_id)    
    @movies = Movie.find(:all, :order => 'updated_at desc') 
  end
end
