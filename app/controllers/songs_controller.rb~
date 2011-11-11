class SongsController < ApplicationController

	def new
		@song = Song.new
	end

	def show
		@song = Song.find(params[:id])
	end

	def create			
	
		# Ensures that all of the fields are filled
		if params[:title].blank?
			flash.now[:notice] = "You didn't give the song a title"
			return
		end
		
		if params[:genre].blank? 
			flash.now[:notice] = "You didn't specify a genre"
			return
		end

		if params[:data].blank? 
			flash.now[:notice] = "You didn't select a file."
			return
		end
		
		# If all fields are filled...
		# Create a new song with these fields
		@song = Song.new
		@song.title = params[:title]
		@song.genre = params[:genre]

		# Following two are temp values until I get them working
		# gsub keeps getting called for some reason for the first issue
		#	@song.data = params[:data]
		# And the user_id should be something like params[:id]
		# or User.id; More testing is needed
		@song.user_id = 1	
		if @song.save
			flash.now[:notice] = "Thanks for contributing! You're file will be available soon"
			#Hopefully
		else
			flash.now[:error] = "There was a problem submitting your song"
			render :action => "index"
			# Returns you to the submit page

		end
	end
	
        def index
       		@title = "Song upload"
		render :file => 'app/views/songs/index.html.erb'
	end
	
end
