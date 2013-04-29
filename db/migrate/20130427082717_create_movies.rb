class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
	  t.string		:title,			:null => false
	  t.string		:description,	:null => false
	  t.integer		:category_id,	:null => false 
	  t.string		:image_url,		:null => false
	  t.integer		:image_num,		:null => false
	  t.string		:thumbnail_url,	:null => false
	  t.datetime	:released_at
          t.integer     :org_id,  :null => false

      t.timestamps
    end
  end
end
