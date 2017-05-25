class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update]

  def index
    @clients = User.all
  end

  def new
    @client = User.new
  end

  def create
    @client = User.new client_params
    if @client.save
      redirect_to clients_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @client.assign_attributes user_params
    if @client.save
      redirect_to clients_path, notice: 'Rol fue editado exitosamente'
    else 
      render :edit
    end
  end

def destroy
    @client.destroy
    redirect_to clients_path
  end

  private 
  def client_params
    params.require(:client).permit(:password, :phone, :email, :address, :ruc, :name, :username)
  end

  def user_params
    params.require(:user).permit(:password, :phone, :email, :address, :ruc, :name, :username)
  end

  def set_client
    @client = User.find params[:id]
  end
end
