class SamplesController < ApplicationController

  def index
    @samples = Sample.all
  end

  def new
    @sample = Sample.new
    @sample.features.build
  end

  def create
    @sample = Sample.new samples_params
    if @sample.save
      redirect_to samples_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private
    def samples_params
      params.require(:sample).permit(:description, :category, features_attributes: [:name, :value, :_destroy])
    end
end
