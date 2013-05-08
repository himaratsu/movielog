# coding: utf-8
require 'spec_helper'

describe Friend do
  describe 'validate' do
    context 'following_id or followed_id is empty' do
      before do
        @friend1 = Friend.new(:following_id => '', :followed_id => '2')
        @friend2 = Friend.new(:following_id => '1', :followed_id => '')
        @friend3 = Friend.new(:following_id => '', :followed_id => '')
      end

      # ユーザIDが空の場合失敗すること
      it 'fails validation of presence' do
        @friend1.should_not be_valid
        @friend2.should_not be_valid
        @friend3.should_not be_valid
      end
    end
  end

end
