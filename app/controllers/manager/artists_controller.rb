class Manager::ArtistsController < ApplicationController

	def index
		@artists = Artist.all
		@artist = Artist.new
    end

    def new
    end

    def create
    	@artist = Artist.new(artist_params)
    	@artist.save
    	redirect_to manager_artists_path
    end

    def show
    end

    def edit
    	@artist = Artist.find(params[:id])
    end

    def update
    end

    def destory
    	artist = Artist.find(params[:id])
    	artist.destory
    	redirect_to manager_artists_path
    end

    private
    def artist_params
    	params.require(:artist).permit(:name)
    end

end
