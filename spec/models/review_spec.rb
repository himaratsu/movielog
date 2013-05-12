# coding: utf-8
require 'spec_helper'

describe Review do
  describe 'validate' do
    context 'user_id' do
      before do
        @review1 = FactoryGirl.build(:review1)
        @review2 = FactoryGirl.build(:review2)
      end

      it "is not a number" do
        @review1.should_not be_valid
      end
      it "is a number" do
        @review2.should be_valid
      end
    end

    context 'movie_id' do
      before do
        @review3 = FactoryGirl.build(:review3)
        @review4 = FactoryGirl.build(:review4)
      end

      it "is not a number" do
        @review3.should_not be_valid
      end

      it "is a numbmer" do
        @review4.should be_valid
      end
    end
  end
end
