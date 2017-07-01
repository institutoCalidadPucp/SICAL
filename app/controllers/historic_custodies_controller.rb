class HistoricCustodiesController < ApplicationController
    before_action :set_custody, only:[:show]
    before_action :set_custodies, only:[:index]

    def index
    end

    def show
    end

    private 

    def set_custody
        #@custody = CustodyOrder.find(params[:id])
    end

    def set_custodies
        #@custodiess = CustodyOrder.relede
        #No implementado
    end
end
