require_relative('../db/sql_runner')
require('pry')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age']
    @house_id = options['house_id']
  end

  def full_name
    return @first_name + " " + @last_name
  end

  def save()
    sql = "INSERT INTO students(first_name, last_name, age, house_id)
    VALUES($1,$2,$3,$4) RETURNING id"
    values = [@first_name, @last_name, @age, @house_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map { |student| Student.new(student) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    return Student.new(student)
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end


end
