# coding: utf-8
require 'spec_helper'

describe UserMovieState do
  describe 'validation' do
    before do
      @user_movie_state = FactoryGirl.build(:user_movie_state_default)
    end

    context 'numeric user_id' do
      it 'passes validation of user_id' do
        @user_movie_state.should be_valid
      end
    end

    context 'non-numeric user_id' do
      it 'fails validation of user_id' do
        @user_movie_state.user_id = 'aaa'
        @user_movie_state.should_not be_valid
      end
    end

    context 'empty user_id' do
      it 'fails validation of user_id' do
        @user_movie_state.user_id = ''
        @user_movie_state.should_not be_valid
      end
    end


    context 'numeric movie_id' do
      it 'passes validation of movie_id' do
        @user_movie_state.should be_valid
      end
    end

    context 'non-numeric movie_id' do
      it 'fails validation of movie_id' do
        @user_movie_state.movie_id = 'aaa'
        @user_movie_state.should_not be_valid
      end
    end

    context 'empty movie_id' do
      it 'fails validation of movie_id' do
        @user_movie_state.user_id = ''
        @user_movie_state.should_not be_valid
      end
    end

    context 'numeric state_id' do
      it 'passes validation of state_id' do
        @user_movie_state.should be_valid
      end
    end

    context 'non-numeric state_id' do
      it 'fails validation of state_id' do
        @user_movie_state.state_id = 'aaa'
        @user_movie_state.should_not be_valid
      end
    end

    context 'empty state_id' do
      it 'fails validation of state_id' do
        @user_movie_state.state_id = ''
        @user_movie_state.should_not be_valid
      end
    end

    context 'too big state_id' do
      it 'fails validation of state_id' do
        @user_movie_state.state_id = 4
        @user_movie_state.should_not be_valid
      end
    end

  end
end
