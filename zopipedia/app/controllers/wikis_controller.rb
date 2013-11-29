class WikisController < ApplicationController
	def new
		@wiki = Wiki.new
		authorize! :create, @wiki, message: "You need to be a member to create a Wiki"
	end

	def create
		@wiki = current_user.wikis.build(params[:wiki])
		authorize! :create, @wiki, message: "You need to be a member to create a Wiki"
		if @wiki.save
			flash[:notice] = "Wiki was Saved"
			redirect_to @wiki
		else
			flash[:error] = "There was an error creating the Wiki"	
			render :new
		end	
	end	
end
