class ClientsController < ApplicationController
  
  before_action :set_client, only: [:edit, :update, :destroy, :show, :toggle_status]
  before_action :roles, only: [:new, :create, :update, :edit]

  def index
    @clients = User.all.client
  end

  def new
    @client = User.new
  end

  def show
  end

  def create
    @client = User.new client_params
    if (@client.set_password).save
      @client.client!
      current_user.register_audit "Creacion de clientes", "added", @client.id, @client.full_name, @client.class.to_s
      redirect_to clients_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @client.assign_attributes client_params.except(:password)
    current_user.register_audit "Actualizacion informacion cliente", "updated", @client.id, @client.full_name, @client.class.to_s
    if @client.save
      redirect_to clients_path, notice: 'Rol fue editado exitosamente'
    else 
      render :edit
    end
  end

  def destroy
    @client.inactive!
    redirect_to clients_path 
  end

  def toggle_status
    current_user.register_audit @client.tooltip_status + " cliente", "updated", @client.id, @client.full_name, @client.class.to_s
    @client.change_status
    respond_to do |format|
      format.js
    end
  end

  private 

    def client_params
      params.require(:user).permit(:phone, :email, :address, :ruc, :name, :person_contact)
    end

    def set_client
      @client = User.find params[:id]
    end

    def roles
      @roles = Role.all
    end
end
