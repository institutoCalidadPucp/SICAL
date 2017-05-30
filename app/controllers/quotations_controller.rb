class QuotationsController < ApplicationController
  def index
    @quotations = Quotation.all
  end

  def show
  end
end
