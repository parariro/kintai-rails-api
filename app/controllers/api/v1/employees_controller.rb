module Api
    module V1
        class EmployeesController < ApplicationController
            before_action :set_employee, only: [:show, :update, :destroy]
    
            def index
                employees = Employee.order(employee_number: :asc)
                render json: { 
                    status: 'SUCCESS', 
                    message: 'Loaded employees', 
                    data: employees
                }
            end
    
            def show
                render json: { 
                    status: 'SUCCESS', 
                    message: 'Loaded the employee', 
                    data: @employee 
                }
            end
    
            def create
                employee = Employee.new(employee_number: params[:employee_number], name: params[:name], employment_status: params[:employment_status], section: params[:section])
                if employee.save
                    render json: { 
                    status: 'SUCCESS', 
                    data: employee 
                    }
                else
                    render json: { 
                    status: 'ERROR', 
                    data: employee.errors 
                    }
                end
            end
    
            def destroy
                @employee.destroy
                render json: { 
                    status: 'SUCCESS', 
                    message: 'Deleted the employee', 
                    data: @employee
                }
            end
    
            def update
                if @employee.update(name: params[:name])
                    render json: { 
                    status: 'SUCCESS', 
                    message: 'Updated the employee', 
                    data: @employee 
                    }
                else
                    render json: { 
                    status: 'SUCCESS', 
                    message: 'Not updated', 
                    data: @employee.errors 
                    }
                end
            end
    
            private
    
            def set_employee
                @employee = Employee.find_by(id: params[:id])
            end
        end
    end
end
