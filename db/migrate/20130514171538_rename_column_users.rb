class RenameColumnUsers < ActiveRecord::Migration
  def up
    rename_column :users, :encrypt_password, :password_digest
  end

  def down
    rename_column :users, :password_digest, :encrypt_password
  end
end
