require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees 
    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries 
        @employees = []
    end 

    def valid_title?(title)
        @salaries.has_key?(title)
    end 

    def >(another_startup)
        self.funding > another_startup.funding 
    end 

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else  
            raise "Not a Valid Employee Title"
        end 
    end 

    def size 
        @employees.length 
    end 

    def pay_employee(employee)
        employee_salary = @salaries[employee.title]
        if @funding >= employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary 
        else  
            raise "Not enought funds"
        end 
    end 

    def payday 
        @employees.each do |employee|
            self.pay_employee(employee)
        end 
    end 

    def average_salary 
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end 
        sum / @employees.length * 1.0
    end  

    def close   
        @employees = []
        @funding = 0
    end 

    def acquire(another_startup)
        @funding += another_startup.funding 
        another_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary 
            end 
        end 
        @employees += another_startup.employees 
        another_startup.close 
    end 

end
