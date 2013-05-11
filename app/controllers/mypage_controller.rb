# encoding: utf-8

class MypageController < ApplicationController
  def index
    @my_id = 1 #仮置き

    # 自分の情報
    @my_info = User.find_by_id(@my_id)
   
    # フォロー数
    @following_count = Friend.num_of_following(@my_id)
  
    # フォロワー数
    @followed_count = Friend.num_of_followed(@my_id)    

    # ログに追加している映画のリスト
    @user_movie_ids = UserMovieState.find(:all, :select => :movie_id, :conditions => ['user_id = ?', @my_id], :order => 'updated_at desc') 
    @movie_ids = Array.new
    @user_movie_ids.each do |user_movie_id|
      @movie_ids.push(user_movie_id.movie_id)
    end
    @movies = Movie.find(:all, :conditions => 'id IN(' + @movie_ids.join(",") + ')' )

  end
end
