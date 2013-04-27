class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
	  t.integer	:following_id,	:null => false
	  t.integer	:followed_id,	:null => false

      t.timestamps
    end
  end
end
