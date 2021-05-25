class TodosController < ApplicationController
  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
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
end
