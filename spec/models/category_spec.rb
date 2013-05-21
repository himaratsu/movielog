# coding: utf-8
require 'spec_helper'

describe Category do
  describe 'title' do
    subject { Category.new(:title => 'title') }

    context 'when not empty' do
      it { should be_valid  }
    end

    context 'when empty' do
      it { 
        subject.title = ''
        should_not be_valid  
      }
    end
  end
end
