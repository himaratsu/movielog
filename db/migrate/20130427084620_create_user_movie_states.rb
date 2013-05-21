class CreateUserMovieStates < ActiveRecord::Migration
  def change
    create_table :user_movie_states do |t|
     t.integer	:user_id,	:null => false
     t.integer	:movie_id,	:null => false
     t.integer	:state_id,	:null => false

     t.timestamps
    end
    add_index :user_movie_states, [:user_id,:movie_id], :name=>"unique_index", :unique=>true
  end
end
