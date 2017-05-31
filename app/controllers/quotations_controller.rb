class QuotationsController < ApplicationController
  def index
    @quotations = Quotation.all
  end

  # Used in the view
  def show
  end

end
