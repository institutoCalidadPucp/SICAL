class EmployeesController < ApplicationController

  before_action :set_employee, only: [:show, :edit, :update, :toggle_status, :destroy]
  before_action :roles, only: [:new, :create, :update, :edit]
  before_action :laboratories, only: [:new, :create, :update, :edit]

  def index
    begin
      
      @employees = User.own_per_user(current_user).employees
    rescue Exception => e
      true
    end
  end

  def show
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def new
    begin
      
      @employee = User.new
    rescue Exception => e
      render :index
    end
  end  

  def edit
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def create
    begin
      @employee = User.new employee_params
      if (@employee.set_password).save
        @employee.employee!
        redirect_to employees_path        
      else
        render :new        
      end
    rescue Exception => e
      render : new
    end
  end

  def update  
    begin
      if @employee.update employee_params.except(:password)
        redirect_to employees_path    
      else
        render :edit         
      end
    rescue Exception => e
      render :edit
    end  
  end

  def destroy
    begin  
      @employee.inactive!
      redirect_to employees_path 
    rescue Exception => e
      render :index
    end
  end

  def toggle_status
    @employee.change_status
    respond_to do |format|
      format.js
    end
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
      @laboratories = Laboratory.all
    end
end 

