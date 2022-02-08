class Employee
    attr_reader :name, :title 

    def initialize(name, title)
        @name = name 
        @title = title 
        @earnings = 0
    end

    def pay(number)
        @earnings += number 
    end 
end
