class TodosController < ApplicationController

  def index
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find_by(id: id)
    if todo.nil?
      render plain: "Todo not found, please check the todo id"
    else
      render plain: todo.to_pleasant_string
    end
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    redirect_to todos_path
  end

  def update
    todo_id = params[:id]
    completed = params[:completed]
    todo = Todo.find(todo_id)
    todo.update(completed: completed)
    redirect_to todos_path
  end

  def destroy
    todo_id = params[:id]
    todo = Todo.find(todo_id)
    todo.destroy
    redirect_to todos_path
  end


end
