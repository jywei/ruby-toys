require 'json'

class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
  end

  def read_permissions
    contents = JSON.load(File.read('user_permission_template.json'))
    puts contents
  end
end

user = User.new('Ryan', 'ryan@example.com')
puts user.name
puts user.email
user.read_permissions
