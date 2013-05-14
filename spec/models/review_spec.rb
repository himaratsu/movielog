# coding: utf-8
require 'spec_helper'

describe Review do
  subject {
    Review.new(
      :user_id     => 99,
      :movie_id    => 99,
      :rate        => 0,
      :comment     => 'abcde',
      :spoiler_flag => 0
    )
  }

  describe 'user_id' do
    context 'when number' do
      it { should be_valid }
    end

    context 'when not a number' do
      it {
          subject.user_id = 'abc'
          should_not be_valid
      }
    end

    context 'when empty' do
      it {
          subject.user_id = ''
          should_not be_valid
      }
    end
  end

  describe 'movie_id' do
    context 'when number' do
      it { should be_valid }
    end

    context 'when not a number' do
      it {
          subject.movie_id = 'abc'
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

  describe 'rate' do
    context 'when min' do
      it { should be_valid }
    end

    context 'when max' do
      it {
          subject.rate = 5
          should be_valid
      }
    end

    context 'when too big' do
      it {
          subject.rate = 6
          should_not be_valid
      }
    end
  end

  describe 'comment' do
    context 'when correct length' do
      it { should be_valid }
    end

    context 'when too short' do
      it {
          subject.comment = 'abcd'
          should_not be_valid
      }
    end

    context 'when too long' do
      it {
          subject.comment = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
          should_not be_valid
      }
    end
  end

  describe 'spoiler_flag' do
    context 'when min' do
      it { should be_valid }
    end

    context 'when max' do
      it {
          subject.spoiler_flag = 0
          should be_valid
      }
    end

    context 'when too big' do
      it {
          subject.spoiler_flag = 2
          should_not be_valid
      }
    end
  end

end
