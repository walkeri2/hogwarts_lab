require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name, :logo

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map{ |house| House.new(house)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

  def self.students()
    sql = "SELECT * FROM students WHERE students.house = $1"
    values = [@name]
    students = SqlRunner.run(sql, values)
    return students.map{|student| Student.new(student)}
  end

end
