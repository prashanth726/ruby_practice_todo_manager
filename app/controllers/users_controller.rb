class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:created_at).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    render plain: "Created new user success"
  end

  def show
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    if user.nil?
      render plain: "false"
    else
      render plain: "true"
    end
  end
end
