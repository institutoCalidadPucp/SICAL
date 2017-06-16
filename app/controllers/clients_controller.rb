class ClientsController < ApplicationController
  
  before_action :set_client, only: [:edit, :update, :destroy, :show, :toggle_status]
  before_action :roles, only: [:new, :create, :update, :edit]

  def index
    begin
      @clients = User.all.client
    rescue Exception => e
      true
    end  
  end

  def new
    begin
      @client = User.new     
    rescue Exception => e
      render :index
    end
  end

  def show
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def create
    begin
      @client = User.new client_params
      if (@client.set_password).save
        @client.client!
        redirect_to clients_path
      else 
        render :new
      end
    rescue Exception => e
      render :new
    end
  end

  def edit
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def update
    begin
      @client.assign_attributes client_params.except(:password)
      if @client.save
        redirect_to clients_path, notice: 'Rol fue editado exitosamente'
      else 
        render :edit
      end
    rescue Exception => e
      render :edit
    end
  end

  def destroy
    begin
      @client.inactive!
      redirect_to clients_path 
    rescue Exception => e
      render :index
    end
  end

  def toggle_status
         
    @client.change_status
    respond_to do |format|
      format.js
    end
  end

  private 

    def client_params
      params.require(:user).permit(:phone, :email, :address, :ruc, :name)
    end

    def set_client
      @client = User.find params[:id]
    end

    def roles
      @roles = Role.all
    end
end
