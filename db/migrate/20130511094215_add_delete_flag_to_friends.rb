class AddDeleteFlagToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :delete_flag, :integer, :null=>false, :limit=>1, :default=>0
  end
end
