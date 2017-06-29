class EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :toggle_status, :destroy]
  before_action :roles, only: [:new, :create, :update, :edit]
  before_action :laboratories, only: [:new, :create, :update, :edit]

  def index
    @employees = User.own_per_user(current_user).employee
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
    @employee.set_laboratory(current_user)  unless current_user.admin?
    if (@employee.set_password).save
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

  def toggle_status
    @employee.change_status
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @employee.inactive!
    redirect_to employees_path 
  end

  private

    def employee_params
      params.require(:user).permit(:phone, :email, :address, :name, :last_name, :date_of_birth, :gender, :role_id, :job_position, :laboratory_id)
    end   

    def set_employee
      @employee = User.find(params[:id])
    end

    def roles
      @roles = Role.all
    end

    def laboratories
      @laboratories = Laboratory.active
    end
end 

