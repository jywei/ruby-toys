require 'json'

class User
  attr_accessor :name, :email

  def initialize(name, email)
    @name = name
    @email = email
    @permissions = read_permissions
  end

  def read_permissions
    JSON.load(File.read('user_permission_template.json'))
  end

  def save
    self_json = {name: @name, email: @email, permissions: @permissions}.to_json
    File.open('user.json', 'a') do |f|
      f.puts self_json
    end
  end
end

# user = User.new('Ryan', 'ryan@example.com')
# puts user.inspect
# user.save
