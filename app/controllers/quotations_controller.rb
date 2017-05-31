class QuotationsController < ApplicationController
  def index
    @quotations = Quotation.all
  end

  # New Test Upload
  def show
  end

end
