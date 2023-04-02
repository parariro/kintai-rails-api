class Employee < ApplicationRecord
    has_many :working_times
    validates :employee_number, length: { minimum: 8, maximum: 8 }
    validates :name, length: { minimum: 2, maximum: 20 }
end
