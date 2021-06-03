require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    @due_date == Date.today
  end

  def self.overdue
    where("due_date < ? and completed = ?", Date.today, false)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.mark_as_complete!(todo_id)
    todo = find_by(id: todo_id)
    todo.update(completed: true)
    todo
  end

  def self.completed
    all.where(completed:true)
  end
end
