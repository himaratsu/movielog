class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
	  t.integer	:movie_id,	:null => false
	  t.string	:name,		:null => false

      t.timestamps
    end
  end
end
