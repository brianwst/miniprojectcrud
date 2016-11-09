class SongsController < ApplicationController
	before_action :set_song, :only => [:show, :edit, :update, :destroy]

	def index
		@songs = Song.page(params[:page]).per(5)
	end

	def show
		@page_title = @song.name
	end

	def new
	end

	def edit
		@page_title = @song.name 
	end

	def create
		@song = Song.new(params_screen)

		if @song.save
			flash[:notice] = "Event was successfully created"
			redirect_to song_path(@song)
		else 
			render 'new'
		end
	end

	def update

		if @song.update(params_screen)
			flash[:notice] = "Event was successfully updated"
			redirect_to song_path(@song)
		else
			render 'edit'
		end
	end

	def destroy

		@song.destroy

		flash[:alert] = "Successful delete"
		redirect_to songs_path(page: params[:page])
	end


	private
	def set_song
		@song = Song.find(params[:id])
	end
	def params_screen
		params.require(:song).permit(:name, :singer, :lyrics)
	end
end
