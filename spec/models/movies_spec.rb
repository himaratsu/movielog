# coding: utf-8
require 'spec_helper'

describe Movie do
  # TODO: presense系のバリデーション

  describe 'sort check' do

    context 'sort by "title"' do
      before do
        FactoryGirl.create(:movie1)
        FactoryGirl.create(:movie2)
        FactoryGirl.create(:movie3)
        @movie = Movie.get_all_data("title")
      end

      it 'works correct' do
        @movie[0].id.should == 2
        @movie[1].id.should == 1
        @movie[2].id.should == 3
      end
    end

    context 'sort by "category_id"' do
      before do
        FactoryGirl.create(:movie1)
        FactoryGirl.create(:movie2)
        FactoryGirl.create(:movie3)
        @movie = Movie.get_all_data("category_id")
      end

      it 'works correct' do
        @movie[0].id.should == 2
        @movie[1].id.should == 3
        @movie[2].id.should == 1
      end
    end

    context 'sort by "released_at"' do
      before do
        FactoryGirl.create(:movie1)
        FactoryGirl.create(:movie2)
        FactoryGirl.create(:movie3)
        @movie = Movie.get_all_data("released_at")
      end

      it 'works correct' do
        @movie[0].id.should == 1
        @movie[1].id.should == 2
        @movie[2].id.should == 3
      end
    end

  end
end
