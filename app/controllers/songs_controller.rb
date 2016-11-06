class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
	end

	def create
		@song = Song.new(params_screen)

		@song.save
		redirect_to @song
	end

	private
	def params_screen
		params.require(:song).permit(:name, :singer)
	end
end
