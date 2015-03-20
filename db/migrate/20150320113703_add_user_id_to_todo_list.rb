class AddUserIdToTodoList < ActiveRecord::Migration
  def change
  	add_column :todo_lists, :user_id, :integer
  	add_index :todo_lists, :user_id # We are adding an index so that the database is gonna optimize the table around this particular column
  end
end
