class WikisController < ApplicationController
	def index
		@wikis = Wiki.all
	end

	def show
		@wiki = Wiki.find(params[:id])
	end

	def new
		@wiki = Wiki.new(params[:wiki])
	end

	def create
		@wiki = current_user.wikis.build(params[:wiki])
		if @wiki.save
			flash[:notice] = "Wiki was Saved!"
			redirect_to [@wiki]		
		else
			flash[:error] = "There was a problem saving the Wiki"	
			render :new
		end
	end	
end
