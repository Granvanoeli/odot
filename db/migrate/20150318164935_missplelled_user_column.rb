class MissplelledUserColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :fisrt_name, :first_name
  end
end
