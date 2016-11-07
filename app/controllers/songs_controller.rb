class SongsController < ApplicationController

	def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
	end

	def edit 
		@song = Song.find(params[:id])
	end

	def create
		@song = Song.new(params_screen)

		if @song.save
			redirect_to song_path(@song)
		else 
			render 'new'
		end
	end

	def update
		@song = Song.find(params[:id])

		if @song.update(params_screen)
			redirect_to song_path(@song)
		else
			render 'edit'
		end
	end

	def destroy
		@song = Song.find(params[:id])
		@song.destroy

		redirect_to songs_path
	end


	private
	def params_screen
		params.require(:song).permit(:name, :singer, :lyrics)
	end
end
