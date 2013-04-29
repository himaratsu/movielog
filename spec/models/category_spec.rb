# coding: utf-8
require 'spec_helper'

describe Category do
  describe 'validate' do
    context 'title is empty' do
      before do
        @category = Category.new(:title => '')
      end

      it 'fails validation of presence' do
        @category.should_not be_valid 
      end
    end
  end
end
