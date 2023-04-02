module Api
    module V1
        class WorkingTimesController < ApplicationController
            before_action :set_working_time, only: [:update, :destroy]
    
            def index
                beginTime = params[:begin]
                convertedBeginTime = Time.at(beginTime.to_i)
                endTime = params[:end]
                convertedEndTime = Time.at(endTime.to_i)
                working_times = Employee.joins(:working_times).select("working_times.id, employees.employee_number, employees.name, working_times.begin, working_times.end").where("begin BETWEEN ? AND ?", convertedBeginTime, convertedEndTime)
                render json: { 
                    status: 'SUCCESS', 
                    message: 'Loaded working_times', 
                    data: working_times
                }
            end
    
            def show
                working_time = Employee.joins(:working_times).select("working_times.id, employees.employee_number, employees.name, working_times.begin, working_times.end").where("working_times.id = ?", params[:id])
                render json: { 
                    status: 'SUCCESS', 
                    message: 'Loaded the working_time', 
                    data: working_time
                }
            end
    
            def create
                beginTime = params[:begin]
                convertedBeginTime = Time.at(beginTime.to_i)
                endTime = params[:end]
                convertedEndTime = Time.at(endTime.to_i)
                working_time = WorkingTime.new(begin: convertedBeginTime, end: convertedEndTime, employee_id: params[:id])
                if working_time.save
                    render json: { 
                    status: 'SUCCESS', 
                    data: working_time 
                    }
                else
                    render json: { 
                    status: 'ERROR', 
                    data: working_time.errors 
                    }
                end
            end
    
            def destroy
                if @working_time.destroy
                    render json: { 
                        status: 'SUCCESS',
                        message: 'Deleted the working_time',
                        data: @working_time
                    }
                else
                    render json: { 
                        status: 'ERROR',
                        message: 'Not updated',
                        data: @working_time.errors
                    }
                end
            end
    
            def update
                beginTime = params[:begin]
                convertedBeginTime = Time.at(beginTime.to_i)
                endTime = params[:end]
                convertedEndTime = Time.at(endTime.to_i)
                if @working_time.update(begin: convertedBeginTime, end: convertedEndTime)
                    render json: { 
                    status: 'SUCCESS', 
                    message: 'Updated the working_time', 
                    data: @working_time 
                    }
                else
                    render json: { 
                    status: 'SUCCESS', 
                    message: 'Not updated', 
                    data: @working_time.errors 
                    }
                end
            end
    
            private
    
            def set_working_time
                @working_time = WorkingTime.find_by(id: params[:id])
            end
        end
    end
end
