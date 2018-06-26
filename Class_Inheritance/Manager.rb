require 'byebug'
require_relative 'Employee'


class Manager < Employee
  
  attr_reader :employees
  
  def initialize(name,title,salary,boss,employees)
    super(name,title,salary,boss)

    @employees=employees
  end 
  
  def bonus(multiplier)
    total_salary = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        employee.employees.each do |emp|
          total_salary += emp.salary
        end 
      end
      total_salary += employee.salary       
    end 
     multiplier * total_salary
  end 
  
end 

Shawna = Employee.new("Shawna", 'TA', 12000, "Darren")
David = Employee.new("David", 'TA', 10000, "Darren")
Darren = Manager.new("Darren", 'TA Manager', 78000, "Ned", [Shawna, David])
Ned = Manager.new("Ned", 'Founder', 1000000, nil, [Darren])



p David.bonus(3) # => 30_000
p Darren.bonus(4) # => 88_000
p Ned.bonus(5) # => 500_000