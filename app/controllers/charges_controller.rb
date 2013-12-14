class ChargesController < ApplicationController
	def new
	end

	def create
	  # Amount in cents
	  @amount = 5000
	  @user = current_user
	  customer = Stripe::Customer.create(
	    :email => '#{@user.email}',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  respond_to do |format|
	    if @user.make_premium
	      format.html { redirect_to @root, :notice => 'User was successfully upgraded.' }
	    else
	      flash[:error] = "There was a problem"
	    end
	  end
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
