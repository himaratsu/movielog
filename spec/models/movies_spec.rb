# coding: utf-8
require 'spec_helper'

describe Movie do
  # TODO: presense系のバリデーション

  describe 'sort check' do

    context 'sort feature' do
      before do
        FactoryGirl.create(:movie1)
        FactoryGirl.create(:movie2)
        FactoryGirl.create(:movie3)
      end

      it 'succeed with the case of "title"' do
        @movie = Movie.get_all_data("title")
        @movie[0].id.should == 2
        @movie[1].id.should == 1
        @movie[2].id.should == 3
      end

      it 'succeed with the case of "category_id"' do
        @movie = Movie.get_all_data("category_id")
        @movie[0].id.should == 2
        @movie[1].id.should == 3
        @movie[2].id.should == 1
      end

      it 'succeed with the case of "released_at"' do
        @movie = Movie.get_all_data("released_at")
        @movie[0].id.should == 1
        @movie[1].id.should == 2
        @movie[2].id.should == 3
      end
    end
  end
end
