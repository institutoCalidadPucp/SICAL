class EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = User.all.employee
  end

  def show
  end

  def new
    @employee = User.new
  end  

  def edit
  end

  def create
    @employee = User.new employee_params  
    if @employee.save
      @employee.employee!
      redirect_to employees_path        
    else
      render :new        
    end
  end

  def update    
    if @employee.update employee_params.except(:password)
      redirect_to employees_path    
    else
      render :edit         
    end
  end
  
  def destroy
    if @employee.destroy
      redirect_to employees_path, notice: 'Empleado fue eliminado exitosamente'
    else
      redirect_to employees_path,  notice: 'Ocurrio un error'
    end    
  end

  private

    def employee_params
      params.require(:user).permit(:password, :phone, :email, :address, :name, :last_name, :date_of_birth, :gender)
    end   

    def set_employee
      @employee = User.find(params[:id])
    end
end 

