class Manager::SongsController < ApplicationController

	 before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end


	def create
	end

	def destroy
	end
end
