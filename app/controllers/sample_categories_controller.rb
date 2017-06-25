class SampleCategoriesController < ApplicationController
  
  before_action :set_sample_category, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :laboratories, only: [:new, :create, :edit, :update, :show]
  before_action :sample_methods, only: [:new, :create, :edit, :update, :show]

  def index
    @sample_categories = SampleCategory.own_per_user(current_user)
  end

  def new
    @sample_category = SampleCategory.new
  end

  def show
  end

  def create    
    @sample_category = SampleCategory.new sample_category_params.merge(:laboratory_id => current_user.laboratory.id) unless current_user.admin?
    @sample_category = SampleCategory.new sample_category_params unless current_user.employee?
    if @sample_category.save
      #@sample_category.set_laboratory(current_user)  unless current_user.admin?
      redirect_to sample_categories_path
    else 
      render :new
    end  
  end

  def edit
  end

  def update
    @sample_category.assign_attributes sample_category_params
    if @sample_category.save
      redirect_to sample_categories_path
    else 
      render :edit
    end
  end

  def toggle_status
    @sample_category.change_status
    respond_to do |format|
      format.js
    end
  end

  private
    def sample_category_params
      params.require(:sample_category).permit(:laboratory_id, :name, :description, sample_method_ids: [])
    end
    

    def set_sample_category
      @sample_category = SampleCategory.find(params[:id])
    end

    def laboratories
      @laboratories = Laboratory.all
    end

    def sample_methods
      @sample_methods = SampleMethod.all
    end

end
