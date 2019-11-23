class Manager::RecordLabelsController < ApplicationController

    before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end

    def index
        @record_labels = RecordLabel.all
        @record_label = RecordLabel.new
    end

    def new
    end

    def create
    	@record_label = RecordLabel.new(record_label_params)
    if	@record_label.save
    	redirect_to manager_record_labels_path
    else
        @record_labels = RecordLabel.all
        render :index
    end
    end

    def show
    end

    def edit
    	@record_label = RecordLabel.find(params[:id])
    end

    def update
        @record_label = RecordLabel.find(params[:id])
    if  @record_label.update(record_label_params)
        redirect_to manager_record_labels_path
    else
        render :edit
    end
    end

    def destroy
    	record_label = RecordLabel.find(params[:id])
    	record_label.destroy
    	redirect_to manager_record_labels_path
    end

    private
    def record_label_params
    	params.require(:record_label).permit(:name)
    end

end