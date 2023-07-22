class Employee
    attr_accessor :empid, :name, :age, :doj, :rating, :reporting_to
  
    def initialize(id, name, age, doj, rating, reporting_to)
      @empid = id
      @name = name
      @age = age
      @doj = doj
      @rating = rating
      @reporting_to = reporting_to
    end
  
    def reporting
      puts "Myself #{@name} is Reporting to #{@reporting_to}"
      puts "\n"
    end
  
    def apply_leave(days)
      puts "#{@name} has applied for #{days} days of leave"
      puts "\n"
    end
  
    def ==(other)
      @rating == other.rating &&
        @doj == other.doj
    end
  
    def self.search_by_name(list, name)
      list.find { |employee| employee.name == name }
    end
  end
  
  employees = [
    Employee.new(1, "Akash", 20, "2023-04-18", 4.5, "Manager"),
    Employee.new(2, "Barath", 21, "2023-06-26", 4.8, "Team Lead"),
    Employee.new(3, "Openheimer", 23, "2022-11-20", 4.2, "Manager")
  ]
  
  employee2 = employees[1]
  employee2.reporting
  
  puts "Enter the number of days taking leave"
  days = gets.chomp.to_i
  employee2.apply_leave(days)
  
  puts "Enter the employee name you want to search: "
  search = gets.chomp
  
  found_employee = Employee.search_by_name(employees, search)
  if found_employee
    puts "FOUND EMPLOYEE:"
    puts "Employee ID: #{found_employee.empid}"
    puts "Name: #{found_employee.name}"
    puts "Age: #{found_employee.age}"
    puts "Date of Birth: #{found_employee.doj}"
    puts "Rating: #{found_employee.rating}"
    puts "\n"
  else
    puts "EMPLOYEE NOT FOUND"
    puts "\n"
  end
  
  # Compare two employees
  employee4 = Employee.new(4, "Vinoth", 30, "2023-04-18", 4.5, "Manager")
  if employees[0] == employee4
    puts "Comparing #{employees[0].name} and #{employee4.name}: Employee #{employees[0].name} and #{employee4.name} are equal."
  else
    puts "Comparing #{employees[0].name} and #{employee4.name}: Employee #{employees[0].name} and #{employee4.name} are not equal."
  end
  