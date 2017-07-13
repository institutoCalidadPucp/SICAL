class HistoricCustodiesController < ApplicationController
    before_action :set_custody_orders, only:[:index]
    before_action :set_custody_order, only:[:show]

    def index
    end

    def show
    end

    private 

    def set_custody_order
        @custody_order = CustodyOrder.find(params[:id])
    end

    def set_custody_orders
        @custody_orders = CustodyOrder.custody_orders_per_related current_user
    end    
end
