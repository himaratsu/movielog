class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
	  t.integer	:user_id,	:null => false
	  t.integer	:movie_id,	:null => false
	  t.integer	:rate,		:null => false, :limit => 1, :default => 0
	  t.string	:comment
          t.integer     :spoiler_flag,  :null => false, :limit => 1, :default => 0

      t.timestamps
    end
  end
end
