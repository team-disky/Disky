class Manager::ArtistsController < ApplicationController

    before_action :login_required

    def login_required
    redirect_to new_manager_session_path unless current_manager
    end

	def index
        @q = Artist.ransack(params[:q])
        @artists = @q.result(distinct: true).where(active: true).page(params[:page]).per(10)
		@artist = Artist.new
    end

    def new
    end

    def create
    	@artist = Artist.new(artist_params)
     if	@artist.save
    	redirect_to manager_artists_path
     else
        @q = Artist.ransack(params[:q])
        @artists = @q.result(distinct: true).where(active: true).page(params[:page]).per(10)
        render :index
     end
    end

    def show
    end

    def edit
    	@artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        if params[:leave]
            @artist.update(active:false)
            redirect_to manager_artists_path
        else
            if  @artist.update(artist_params)
                redirect_to manager_artists_path
            else
                render :edit
            end
        end
    end

    def destroy
    end

    private
    def artist_params
    	params.require(:artist).permit(:name, :active)
    end

end
