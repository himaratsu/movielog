#encoding: utf-8

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @my_num = 1 #いずれセッションを使う
    @user = User.find(params[:id])
    @is_friend = Friend.where('following_id = ? and followed_id = ?', @my_num, @user.id).count
    @following_count = Friend.where('following_id = ?', @user.id).count
    @followed_count = Friend.where('followed_id = ?', @user.id).count
  end

  def new
    @user = User.new
  end

  def follow
    @my_num = 1 #いずれセッションを使う
    @user = User.find(params[:id])
    @is_friend = Friend.where('following_id = ? and followed_id = ?', @my_num, @user.id).count
    if @is_friend == 0
      @friend = Friend.new(:following_id => @my_num, :followed_id => params[:id])
      @friend.save
      redirect_to user_path(params[:id]), notice:  'フォロー成功！'
    else
      redirect_to user_path(params[:id]), notice: 'すでにフォローしています'
    end
  end

  def unfollow
    @my_num = 1 #いずれセッションを使う
    @friend = Friend.where('following_id = ? and followed_id = ?', @my_num, params[:id]).first
    if @friend.present?
      @friend.destroy
      redirect_to user_path(params[:id]), notice: 'フォロー解除！'
    else
      redirect_to user_path(params[:id]), notice: 'フォローしていないユーザです'
    end
  end
end
