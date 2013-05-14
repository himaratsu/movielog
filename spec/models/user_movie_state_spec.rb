# coding: utf-8
require 'spec_helper'

describe UserMovieState do
  subject {
    UserMovieState.new(
      :user_id => 99,
      :movie_id => 99,
      :state_id => 0,
    )
  }

  describe 'user_id' do
    context 'when number' do
      it {
        should be_valid
      }
    end

    context 'when not a number' do
      it {
        subject.user_id = 'aaa'
        should_not be_valid
      }
    end

    context 'when empty' do
      it {
        subject.user_id = ''
        should_not be_valid
      }
    end


    context 'numeric movie_id' do
      it 'passes validation of movie_id' do
        should be_valid
      end
    end
  end
 
  describe "movie_id" do
    context 'when number' do
      it {
        subject.movie_id = 'aaa'
        should_not be_valid
      }
    end

    context 'when empty' do
      it {
        subject.movie_id = ''
        should_not be_valid
      }
    end
  end

  describe "state_id" do
    context 'when numeric' do
      it {
        should be_valid
      }
    end

    context 'when not a number' do
      it {
        subject.state_id = 'aaa'
        should_not be_valid
      }
    end

    context 'when empty' do
      it {
        subject.state_id = ''
        should_not be_valid
      }
    end

    context 'when too big number' do
      it {
        subject.state_id = 4
        should_not be_valid
      }
    end
  end

end
