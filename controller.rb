require('sinatra')
require('sinatra/contrib/all')
require('pry')

require_relative('./models/student.rb')
require_relative('./models/house.rb')
also_reload("./models/*")

get '/hogwarts/students' do
  @students = Student.all
  @houses = House.all
  erb(:index)
end

get '/hogwarts/students/new' do
  @houses = House.all()
  erb(:new)
end

post '/hogwarts/students' do
  @student = Student.new(params)
  @student.save()
  redirect('/hogwarts/students')
end
