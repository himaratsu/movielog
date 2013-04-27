class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
	  t.string		:name,				:null => false
	  t.string		:nickname,			:null => false
	  t.string		:email,				:null => false
	  t.string		:encrypt_password,	:null => false
	  t.string		:admin_flag,		:null => false
	  t.string		:icon_url
	  t.integer		:sex,				:null => false, :limit => 1, :default => 0
	  t.datetime	:birthday

      t.timestamps
    end
  end
end
