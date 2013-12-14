class WikisController < ApplicationController
	def index
		@wikis = Wiki.all
	end

	def show
		@wiki = Wiki.find(params[:id])
		authorize! :read, @wiki, message: "You need to be signed-in to see that wiki"
	end

	def new
		@wiki = Wiki.new(params[:wiki])
	end

	def create
		@wiki = current_user.wikis.build(params[:wiki])
		if @wiki.save
			if @wiki.private == true
				flash[:notice] = "You created a new private Wiki!"
			else
				flash[:notice] = "You created a new public Wiki!"
			end
			redirect_to [@wiki]
		else
			flash[:error] = "There was a problem saving the Wiki"	
			render :new
		end
	end	
end
