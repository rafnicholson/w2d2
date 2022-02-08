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
            raise  
        end 
    end 

end
