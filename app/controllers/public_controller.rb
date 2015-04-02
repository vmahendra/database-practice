class PublicController < ApplicationController

def album_list
	@albums = Album.find_by_sql('SELECT * FROM albums 
		WHERE release_date <= \'1978-01-01\'AND artist_old LIKE \'%rolling stones%\' 
		ORDER BY release_date ASC;')
end
def alt_album_list
	artist_old = 'pit'
	release_date = 1978-01-01
	@albums = Album.find(:all, 
		:conditions => ["release_date >= ? AND artist_old LIKE ?", release_date, '%' + artist_old + '%'],
		:order => 'title,release_date ASC',
		:limit => 10, :offset => 0)
	render(:action => 'album_list')
end
def show_album
	artist_old = 'talkin'
		release_date = '1978-01-01'
		@album = Album.find(:first, 
			:conditions => ["release_date >= ? AND artist_old LIKE ?", release_date, '%' + artist_old + '%'],
			:order => 'title,release_date ASC')
	
	
end

def list
	@albums = Album.find(:all)
	render(:action => 'album_list')
	end 

def show
@album = Album.find_by_id(params['id'])
render(:action => 'show_album')
	end
	def new
		@album = Album.new
		
	end
	def create
		@album = Album.new
		@album.artist_id = 0
		@album.feature = 'somthing'
		@album.image_path = 'somthi more'
		
		 # if @album.save
			# redirect_to(:action =>'alt_album_list')
		 #  else
		render(:action => 'show_album')
	 # end
	end

	def edit 
		@album = Album.find_by_id(params[:id])
	end

	def update
		@album = Album.find(params[:id])
			 if @album.update_attributes(params[:album])
				redirect_to(:action =>'list')
			  else
			render(:action => 'edit')
		  end

	end


end
