class ContractsController < ApplicationController
 
  def index
    begin
      
    rescue Exception => e
      render :index
    end
  end

  def new
    begin
      
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
      
    rescue Exception => e
      render :edit
    end
  end

  def destroy
    begin
      
    rescue Exception => e
      render :index
    end
  end
  
end
