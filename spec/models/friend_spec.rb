# coding: utf-8
require 'spec_helper'

describe Friend do
  describe 'validate' do
    context 'following_id or followed_id is empty' do
      before do
        @friend1 = Friend.new(:following_id => '', :followed_id => '2')
        @friend2 = Friend.new(:following_id => '1', :followed_id => '')
      end

      # ユーザIDが空でない
      it 'fails validation of presence' do
        @friend1.should_not be_valid
        @friend2.should_not be_valid
      end
    end
  end

  describe 'duplicate' do
    context 'following_id same to followed_id' do
      before do
        @friend = Friend.new(:following_id => '1', :folloewd_id => '1')
      end

      # フォローするのが自分ならエラーを出す
      it 'fails follow myself' do
        @friend.save be_false
      end
    end
  end
end
