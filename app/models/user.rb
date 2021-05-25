class User < ActiveRecord::Base
  def to_pleasant_string
    "User name: #{name}, User email: #{email}"
  end
end
