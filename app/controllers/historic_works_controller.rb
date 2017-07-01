class HistoricWorksController < ApplicationController
    before_action :set_work, only:[:show]
    before_action :set_works, only:[:index]

    def index
        @works = WorkOrder.work_orders_related current_user
    end

    def show
    end

    private 

    def set_work
        @work = WorkOrder.find(params[:id])
    end

    def set_works
               
    end
end
