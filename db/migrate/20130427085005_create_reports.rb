class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
	  t.integer	:user_id,	:null => false
	  t.string	:text
	  t.integer	:type,		:null => false, :limit => 1

      t.timestamps
    end
  end
end
