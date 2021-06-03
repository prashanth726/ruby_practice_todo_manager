class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
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
    render plain: "Hey the new todo is created #{new_todo.id}"
  end

  def update
    todo_id = params[:id]
    completed = params[:completed]
    todo = Todo.find(todo_id)
    todo.update(completed: completed)
    render plain: "Updated status of todo with id #{completed}"
  end
end
