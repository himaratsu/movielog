class Movie < ActiveRecord::Base
  attr_accessible :id, :title, :description, :category_id, :image_url, :image_num, :thumbnail_url
end
