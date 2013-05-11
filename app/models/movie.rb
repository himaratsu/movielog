class Movie < ActiveRecord::Base
  attr_accessible :id, :title, :description, :category_id, :image_url, :image_num, :org_id, :thumbnail_url, :released_at
end
