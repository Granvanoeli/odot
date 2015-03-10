require 'spec_helper'

describe "Viewing todo items" do

	let!(:todo_list) { TodoList.create(title: "Grocery list", description: "Groceries") }


	# before do
	# 	visit "/todo_lists"
	# 	within "#todo_list_#{todo_list.id}" do
	# 		click_link "List Items"
	# 	end
	# end

	it "displays the title of the todo_list" do
		visit_todo_list(todo_list)
		within ("h1#titolo_lista") do
			expect(page).to have_content(todo_list.title)
		end

	end

	it "displays no items when the todo list is empty" do
		visit_todo_list(todo_list)
		expect(page.all("ul.todo_items li").size).to eq(0)

	end

	it "displays item content when todo_list has items" do
		todo_list.todo_items.create(content: "Milk")
		todo_list.todo_items.create(content: "Egg")
		visit_todo_list(todo_list)
		expect(page.all("table.todo_items tr").size).to eq(2)
		
		within "table.todo_items" do
			expect(page).to have_content("Milk")
			expect(page).to have_content("Egg")
		end

	end

end
