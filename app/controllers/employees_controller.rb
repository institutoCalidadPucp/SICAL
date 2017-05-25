class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = User.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = User.new
  end  

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = User.new(employee_params)    
    if @employee.save
      redirect_to employee_path        
    else
      render :new        
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update    
    if @employee.update(employee_params)
      redirect_to @employee        
    else
      render :edit         
    end
  end
  

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    redirect_to employees_url              
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = User.find(params[:id])
  end
  
  

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:user).permit(:password,:phone,:email,:address,:ruc,:name,:username)
  end   
end 

