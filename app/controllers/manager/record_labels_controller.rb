class Manager::RecordLabelsController < ApplicationController

    def index
        @record_labels = RecordLabel.all
        @record_label = RecordLabel.new
    end

    def new
    end

    def create
    	@record_label = RecordLabel.new(record_label_params)
    	@record_label.save
    	redirect_to manager_record_labels_path
    end

    def show
    end

    def edit
    	@record_label = RecordLabel.find(params[:id])
    end

    def update
        @record_label = RecordLabel.find(params[:id])
        @record_label.update(record_label_params)
        redirect_to manager_record_labels_path
    end

    def destory
    	record_label = RecordLabel.find(params[:id])
    	record_label.destory
    	redirect_to manager_record_labels_path
    end

    private
    def record_label_params
    	params.require(:record_label).permit(:name)
    end

end